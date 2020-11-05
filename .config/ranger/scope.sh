#!/bin/sh

# path:       /home/klassiker/.config/ranger/scope.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-11-05T11:43:58+0100

# exit | function   | action of ranger

# 0    | success    | display stdout as preview
# 1    | no preview | display no preview at all
# 2    | plain text | display the plain content of the file
# 3    | fix width  | don't reload when width changes
# 4    | fix height | don't reload when height changes
# 5    | fix both   | don't ever reload
# 6    | image      | display the image ($image_cache_path) as an image
# 7    | image      | display the file directly as an image

# script arguments
# full path of the highlighted file
file_path="$1"
# width of the preview pane (number of fitting characters)
preview_width="$2"
# height of the preview pane (number of fitting characters)
# preview_height is provided for convenience and unused
# shellcheck disable=SC2034
preview_height="$3"
# full path that should be used to cache image preview
image_cache_path="$4"
# 'True' if image previews are enabled, 'False' otherwise
preview_image="$5"

# file identification
mime_type="$(file --dereference --brief --mime-type "$file_path")"
file_extension="$(printf "%s" "${file_path##*.}" \
                    | tr '[:upper:]' '[:lower:]')"

handle_image() {
    case "$1" in
        image/svg+xml|image/svg)
            convert "$file_path" "$image_cache_path" \
                && exit 6
            exit 1
            ;;
        image/*)
            orientation="$(identify -format '%[EXIF:Orientation]\n' "$file_path")"
            # if orientation data is present and the image actually
            # needs rotating ("1" means no rotation)...
            [ -n "$orientation" ] \
                && [ "$orientation" != 1 ] \
                && convert "$file_path" -auto-orient "$image_cache_path" \
                && exit 6
            # w3mimgdisplay will be called for all images (unless overriden
            # as above), but might fail for unsupported types.
            exit 7
            ;;
        video/*)
            ffmpegthumbnailer -i "$file_path" -o "$image_cache_path" -s 0 \
                && exit 6
            exit 1
            ;;
        application/pdf)
            pdftoppm -f 1 -l 1 \
                -scale-to-x 960 \
                -scale-to-y -1 \
                -singlefile \
                -jpeg \
                -tiffcompression jpeg "$file_path" "${image_cache_path%.*}" \
                    && exit 6 \
                    || exit 1
            ;;
    esac
}

handle_extension() {
    case "$file_extension" in
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            bsdtar --list --file "$file_path" \
                && exit 5
            exit 1
            ;;
        rar)
            # avoid password prompt by providing empty password
            unrar lt -p- "$file_path" \
                && exit 5
            exit 1
            ;;
        7z)
            # avoid password prompt by providing empty password
            7z l -p "$file_path" \
                && exit 5
            exit 1
            ;;
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "$file_path" - \
                | fmt -w "$preview_width" \
                    && exit 5
            exit 1
            ;;
        torrent)
            transmission-show "$file_path" \
                && exit 5
            exit 1
            ;;
        odt|ods|odp|sxw)
            odt2txt "$file_path" \
                && exit 5
            exit 1
            ;;
        xlsx)
            xlsx2csv "$file_path" \
                && exit 5
            exit 1
            ;;
        otf|ttf|woff|ttc)
            convert -size "960x960" xc:"#000000" \
                -gravity center \
                -pointsize 72 \
                -font "$file_path" \
                -fill "#ffffff" \
                -annotate +0+0 "ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@$\%(){}[]" \
                -flatten "$image_cache_path" \
                    && exit 6
            exit 1
            ;;
        htm|html|xhtml)
            w3m -dump "$file_path" \
                && exit 5
            ;;
        json)
            python -m json.tool "$file_path" \
                && exit 5
            ;;
        dff|dsf|wv|wvc)
            exiftool "$file_path" \
                && exit 5
            ;;
    esac
}

handle_mime() {
    case "$1" in
        text/rtf|*msword)
            catdoc "$file_path" \
                && exit 5
            exit 1
            ;;
        *wordprocessingml.document|*/epub+zip|*/x-fictionbook+xml)
            pandoc -s -t markdown "$file_path" \
                && exit 5
            exit 1
            ;;
        *ms-excel)
            xls2csv "$file_path" \
                && exit 5
            exit 1
            ;;
        text/* | */xml)
            # syntax highlight
            max_byte=262143 # 256KiB
            [ "$( stat --printf='%s' "$file_path" )" -gt "$max_byte" ] \
                && exit 2
            highlight \
                --style="pablo" \
                --max-size="$max_byte" \
                --replace-tabs="4" \
                --out-format="xterm256" \
                --force "$file_path" \
                    && exit 5
            exit 2
            ;;
        image/vnd.djvu)
            exiftool "$file_path" \
                && exit 5
            exit 1
            ;;
        image/*)
            exiftool "$file_path" \
                && exit 5
            exit 1
            ;;
        video/* | audio/*)
            exiftool "$file_path" \
                && exit 5
            exit 1
            ;;
    esac
}

handle_fallback() {
    printf '##### File Type Classification #####\n' \
        && file --dereference --brief "$file_path" \
        && exit 5
    exit 1
}

[ "$preview_image" = 'True' ] \
    && handle_image "$mime_type"
handle_extension
handle_mime "$mime_type"
handle_fallback

exit 1
