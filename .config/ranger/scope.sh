#!/bin/sh

# path:       /home/klassiker/.config/ranger/scope.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-11-03T21:40:21+0100

# exit | function   | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | display stdout as preview
# 1    | no preview | display no preview at all
# 2    | plain text | display the plain content of the file
# 3    | fix width  | don't reload when width changes
# 4    | fix height | don't reload when height changes
# 5    | fix both   | don't ever reload
# 6    | image      | display the image $image_cache_path points to as an image preview
# 7    | image      | display the file directly as an image

# script arguments
file_path="$1"              # full path of the highlighted file
pv_width="$2"               # width of the preview pane (number of fitting characters)
# shellcheck disable=SC2034 # pv_height is provided for convenience and unused
pv_height="$3"              # height of the preview pane (number of fitting characters)
image_cache_path="$4"       # full path that should be used to cache image preview
pv_image_enabled="$5"       # 'True' if image previews are enabled, 'False' otherwise.

# file identification
mimetype="$(file --dereference --brief --mime-type -- "$file_path")"
file_extension="$(printf "%s" "${file_path##*.}" \
                    | tr '[:upper:]' '[:lower:]')"

handle_image() {
    default_size="960x540"
    case "$1" in
        image/svg+xml|image/svg)
            convert -- "$file_path" "$image_cache_path" \
                && exit 6
            exit 1;;
        image/*)
            orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file_path")"
            # if orientation data is present and the image actually
            # needs rotating ("1" means no rotation)...
            [ -n "$orientation" ] \
                && [ "$orientation" != 1 ] \
                && convert -- "$file_path" -auto-orient "$image_cache_path" \
                && exit 6
            # `w3mimgdisplay` will be called for all images (unless overriden
            # as above), but might fail for unsupported types.
            exit 7;;
        video/*)
            ffmpegthumbnailer -i "$file_path" -o "$image_cache_path" -s 0 \
                && exit 6
            exit 1;;
        application/pdf)
            pdftoppm -f 1 -l 1 \
                -scale-to-x "${default_size%x*}" \
                -scale-to-y -1 \
                -singlefile \
                -jpeg -tiffcompression jpeg \
                -- "$file_path" "${image_cache_path%.*}" \
                    && exit 6 \
                    || exit 1;;
    esac
}

handle_font() {
    case "$file_extension" in
        otf|ttf|woff|ttc)
            sample_text="ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@$\%(){}[]"
            convert -size 560x560 xc:"#000000" \
                -gravity center \
                -pointsize 38 \
                -font "$file_path" \
                -fill "#ffffff" \
                -annotate +0+0 "$sample_text" \
                -flatten "$image_cache_path" \
                    && exit 6
            exit 1
            ;;
    esac
}

handle_extension() {
    case "$file_extension" in
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            atool --list -- "$file_path" \
                && exit 5
            bsdtar --list --file "$file_path" \
                && exit 5
            exit 1;;
        rar)
            # avoid password prompt by providing empty password
            unrar lt -p- -- "$file_path" \
                && exit 5
            exit 1;;
        7z)
            # avoid password prompt by providing empty password
            7z l -p -- "$file_path" \
                && exit 5
            exit 1;;
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "$file_path" - \
                | fmt -w "$pv_width" \
                    && exit 5
            mutool draw -F txt -i -- "$file_path" 1-10 \
                | fmt -w "$pv_width" \
                    && exit 5
            exiftool "$file_path" \
                && exit 5
            exit 1;;
        torrent)
            transmission-show -- "$file_path" \
                && exit 5
            exit 1;;
        odt|ods|odp|sxw)
            odt2txt "$file_path" \
                && exit 5
            pandoc -s -t markdown -- "$file_path" \
                && exit 5
            exit 1;;
        xlsx)
            xlsx2csv -- "$file_path" \
                && exit 5
            exit 1;;
        htm|html|xhtml)
            w3m -dump "$file_path" \
                && exit 5
            lynx -dump -- "$file_path" \
                && exit 5
            elinks -dump "$file_path" \
                && exit 5
            pandoc -s -t markdown -- "$file_path" \
                && exit 5
            ;;
        json)
            jq --color-output . "$file_path" \
                && exit 5
            python -m json.tool -- "$file_path" \
                && exit 5
            ;;
        # direct stream digital/transfer (DSDIFF) and wavpack aren't detected
        # by file(1).
        dff|dsf|wv|wvc)
            mediainfo "$file_path" \
                && exit 5
            exiftool "$file_path" \
                && exit 5
            ;;
    esac
}

handle_mime() {
    case "$1" in
        text/rtf|*msword)
            catdoc -- "$file_path" \
                && exit 5
            exit 1;;
        *wordprocessingml.document|*/epub+zip|*/x-fictionbook+xml)
            pandoc -s -t markdown -- "$file_path" \
                && exit 5
            exit 1;;
        *ms-excel)
            xls2csv -- "$file_path" \
                && exit 5
            exit 1;;
        text/* | */xml)
            # syntax highlight
            max_size=262143 # 256KiB
            [ "$( stat --printf='%s' -- "$file_path" )" -gt "$max_size" ] \
                && exit 2
            highlight \
                --style="pablo" \
                --max-size="$max_size" \
                --replace-tabs="4" \
                --out-format="xterm256" \
                --force -- "$file_path" \
                    && exit 5
            exit 2;;
        image/vnd.djvu)
            djvutxt "$file_path" | fmt -w "$pv_width" \
                && exit 5
            exiftool "$file_path" \
                && exit 5
            exit 1;;
        image/*)
            exiftool "$file_path" \
                && exit 5
            exit 1;;
        video/* | audio/*)
            mediainfo "$file_path" \
                && exit 5
            exiftool "$file_path" \
                && exit 5
            exit 1;;
    esac
}

handle_fallback() {
    printf '##### File Type Classification #####\n' \
        && file --dereference --brief -- "$file_path" \
        && exit 5
    exit 1
}

[ "$pv_image_enabled" = 'True' ] \
    && handle_image "$mimetype"
handle_font
handle_extension
handle_mime "$mimetype"
handle_fallback

exit 1
