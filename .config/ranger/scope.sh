#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/scope.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-03-31T18:28:12+0200

# exit | function   | action of ranger

# 0    | success    | display stdout as preview
# 1    | no preview | display no preview at all
# 2    | plain text | display the plain content of the file
# 3    | fix width  | don't reload when width changes
# 4    | fix height | don't reload when height changes
# 5    | fix both   | don't ever reload
# 6    | image      | display the image ($image_cache_path) as an image
# 7    | image      | display the file directly as an image

# time limit for preview creation in seconds
time_out=5

# script arguments
# full path of the highlighted file
file_path="$1"
# width of the preview pane (number of fitting characters)
# preview_width="$2"
# height of the preview pane (number of fitting characters)
# preview_height is provided for convenience and unused
# preview_height="$3"
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
        image/svg*)
            rsvg-convert \
                --keep-aspect-ratio \
                --width 960 "$file_path" \
                --output "$image_cache_path" \
                    && exit 6
            exit 1
            ;;
        image/*)
            exit 7
            ;;
        video/*)
            ffmpegthumbnailer -i "$file_path" -o "$image_cache_path" -s 0 \
                && exit 6
            exit 1
            ;;
        audio/*)
            # get embedded thumbnail
            ffmpeg -y -i "$file_path" -c:v copy "$image_cache_path" \
                && exit 6
            exit 1
            ;;
        font/* | *opentype)
            preview_text() {
                printf "%s" \
                    'AÄBCDEFGHIJKLMN\n' \
                    'OÖPQRSẞTUÜVWXYZ\n' \
                    'aäbcdefghijklmn\n' \
                    'oöpqrsßtuüvwxyz\n' \
                    '1234567890,.*/+-=\%\n' \
                    '~!?@#§$&(){}[]<>;:'
            }
            font_name() {
                fc-list \
                    | grep "$file_path" \
                    | cut -d ':' -f2 \
                    | sed 's/^ //g' \
                    | uniq
            }
            # WORKAROUND: for transparent background convert to png and
            # rename the file to jpg (hardcoded .jpg in actions.py)
            convert -size '960x960' xc:'#000000' \
                -font "$file_path" \
                -fill '#cccccc' \
                -gravity Center \
                -pointsize 72 \
                -annotate +0+0 "$(preview_text)" \
                -font '' \
                -fill '#4185d7' \
                -gravity SouthWest \
                -pointsize 24 \
                -annotate +0+0 "$(font_name)" \
                -flatten "$image_cache_path.png" \
                    && mv "$image_cache_path.png" "$image_cache_path" \
                    && exit 6
            exit 1
            ;;
        */pdf)
            pdftoppm -f 1 -l 1 \
                -scale-to-x 960 \
                -scale-to-y -1 \
                -singlefile \
                -jpeg \
                -tiffcompression jpeg "$file_path" "${image_cache_path%.*}" \
                    && exit 6
            exit 1
            ;;
        */vnd.oasis.opendocument* \
            | */vnd.openxmlformats-officedocument* \
            | *ms-excel | *msword | *mspowerpoint | */rtf)
                file_name="$(basename "${file_path%.*}")"
                cache_dir="${image_cache_path%"$(basename "$image_cache_path")"}"

                libreoffice --convert-to jpeg "$file_path" --outdir "$cache_dir" \
                    && mv "$cache_dir$file_name.jpeg" "$image_cache_path" \
                    && exit 6
                exit 1
            ;;
    esac
}

handle_extension() {
    case "$1" in
        7z | a | alz | apk | arj | bz | bz2 | bzip2 | cab | cb7 | cbt | chm \
            | chw | cpio | deb | dmg | gz | gzip | hxs | iso | jar | lha | lz \
            | lzh | lzma | lzo | msi | pkg | rar | rpm | swm | tar | taz | tbz \
            | tbz2 | tgz | tlz | txz | tz2 | tzo | tzst | udf | war | wim | xar \
            | xpi | xz | z | zip | zst)
            # requires compressor.sh (https://github.com/mrdotx/compressor)
            timeout "$time_out" compressor.sh --list "$file_path" \
                && exit 0
            exit 1
            ;;
        csv)
            column --separator '	;,' --table "$file_path" \
                && exit 0
            exit 2
            ;;
        dff | dsf | wv | wvc)
            exiftool "$file_path" \
                && exit 0
            exit 1
            ;;
        bin | exe | dat | o)
            timeout "$time_out" xxd "$file_path" \
                && exit 0
            exit 1
            ;;
        ini)
            highlight --max-size=1M "$file_path" \
                && exit 0
            exit 2
            ;;
        gpg | asc)
            pwd | grep -q "^${PASSWORD_STORE_DIR-$HOME/.password-store}" \
                && gpg --decrypt "$file_path" \
                    | sed '1 s/^.*$/***/; 2 s/^username:.*$/username: ***/' \
                && exit 0

            gpg --decrypt "$file_path" \
                && exit 0
            exit 1
            ;;
    esac
}

handle_mime() {
    case "$1" in
        *sqlite3)
            sqlite3 -header -column "$file_path" \
                "SELECT name, type
                 FROM sqlite_master
                 WHERE type IN ('table','view')
                 AND name NOT LIKE 'sqlite_%'
                 ORDER BY 1;" \
                && exit 0
            exit 1
            ;;
        */*html*)
            w3m -dump "$file_path" \
                && exit 0
            exit 2
            ;;
        */x-bittorrent)
            aria2c --show-files "$file_path" \
                && exit 0
            exit 1
            ;;
        */x-executable | */x-pie-executable | */x-sharedlib)
            readelf --wide --demangle --all "$file_path" \
                && exit 0
            exit 1
            ;;
        image/* | video/* | audio/*)
            exiftool "$file_path" \
                && exit 0
            exit 1
            ;;
        text/troff)
            man "$file_path" \
                && exit 0
            exit 2
            ;;
        text/* | */javascript | */json | */xml)
            highlight --max-size=1M "$file_path" \
                && exit 0
            exit 2
            ;;
    esac
}

handle_fallback() {
    printf "##### File Status #####\n" \
        && stat --dereference "$file_path" \
        && printf "\n##### File Type Classification #####\n" \
        && file --dereference --brief "$file_path" \
        && printf "%s\n" "$mime_type" \
        && exit 0
    exit 1
}

[ "$preview_image" = 'True' ] \
    && handle_image "$mime_type"
handle_extension "$file_extension"
handle_mime "$mime_type"
LC_ALL=C LANG=C handle_fallback
