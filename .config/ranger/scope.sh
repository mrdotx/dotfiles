#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/scope.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2025-02-17T07:21:33+0100

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
file_extension="$(printf "%s" "${file_path##*.}" | tr '[:upper:]' '[:lower:]')"

handle_image() {
    case "$mime_type" in
        */x-mpegurl)
            return 0
            ;;
        image/x-xcf | image/x-tga )
            magick "$file_path" -flatten "$image_cache_path" \
                && exit 6
            exit 1
            ;;
        image/*)
            exit 7
            ;;
        audio/* | video/*)
            ffmpegthumbnailer -i "$file_path" \
                    -o "$image_cache_path" -s0 \
                && exit 6
            exit 1
            ;;
        font/* | *opentype)
            # WORKAROUND: for transparent background convert to png and
            # rename the file to jpg (hardcoded .jpg in actions.py)
            magick -size '960x960' xc:'#000000' \
                    -font "$file_path" \
                    -fill '#cccccc' \
                    -gravity Center \
                    -pointsize 72 \
                    -annotate +0+0 \
                        "$(printf "%s" \
                            "AÄBCDEFGHIJKLMN\n" \
                            "OÖPQRSẞTUÜVWXYZ\n" \
                            "aäbcdefghijklmn\n" \
                            "oöpqrsßtuüvwxyz\n" \
                            "1234567890,.*/+-=\%\n" \
                            "~!?@#§$&(){}[]<>;:" \
                        )" \
                    -font '' \
                    -fill '#4185d7' \
                    -gravity SouthWest \
                    -pointsize 24 \
                    -annotate +0+0 \
                        "$(fc-list \
                            | grep "$file_path" \
                            | cut -d ':' -f2 \
                            | sed 's/^ //g' \
                            | uniq \
                        )" \
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
                    "$file_path" "${image_cache_path%.*}" \
                && exit 6
            exit 1
            ;;
        */vnd.oasis.opendocument* \
            | */vnd.openxmlformats-officedocument* \
            | *ms-excel | *msword | *mspowerpoint | */rtf)
                file_name="$(basename "${file_path%.*}")"
                cache_dir="${image_cache_path%"$(basename "$image_cache_path")"}"

                libreoffice \
                        --convert-to 'jpg:writer_jpg_Export:
                                        {
                                            "PageRange":
                                                {
                                                    "type":"string",
                                                    "value":"1"
                                                }
                                        }' "$file_path" \
                        --outdir "$cache_dir" \
                    && mv "$cache_dir$file_name.jpg" "$image_cache_path" \
                    && exit 6
                exit 1
            ;;
    esac
}

handle_extension() {
    case "$file_extension" in
        7z | a | alz | apk | arj | bz | bz2 | bzip2 | cab | cb7 | cbt | chm \
            | chw | cpio | deb | dmg | gz | gzip | hxs | img | iso | jar | lha \
            | lz | lzh | lzma | lzo | msi | pkg | rar | rpm | swm | tar | taz \
            | tbz | tbz2 | tgz | tlz | txz | tz2 | tzo | tzst | udf | war | wim \
            | xar | xpi | xz | z | zip | zst)
                # requires compressor.sh (https://github.com/mrdotx/shell)
                timeout 5 compressor.sh --list "$file_path" \
                    && exit 0
                exit 1
            ;;
        issue)
            printf "%b\nhost login: _" \
                    "$(sed \
                        -e 's/\\4{/INTERFACE{/g' \
                        -e 's/\\4/11.11.11.11/g' \
                        -e 's/\\6{/INTERFACE{/g' \
                        -e 's/\\6/::ffff:0b0b:0b0b/g' \
                        -e 's/\\b/38400/g' \
                        -e 's/\\d/Fri Nov 11  2011/g' \
                        -e 's/\\l/tty1/g' \
                        -e 's/\\m/x86_64/g' \
                        -e 's/\\n/host/g' \
                        -e 's/\\o/(none)/g' \
                        -e 's/\\O/unknown_domain/g' \
                        -e 's/\\r/2.4.37-arch1-1/g' \
                        -e 's/\\s/Linux/g' \
                        -e 's/\\S{/VARIABLE{/g' \
                        -e 's/\\S/Arch Linux/g' \
                        -e 's/\\t/11:11:11/g' \
                        -e 's/\\u/1/g' \
                        -e 's/\\U/1 user/g' \
                        -e 's/\\v/#1 SMP PREEMPT_DYNAMIC Fri, 11 Nov 2011 11:11:11 +0000/g' \
                        -e 's/\\e/\\033/g' \
                        "$file_path" \
                    )" \
                && exit 0
            exit 2
            ;;
        gpg | asc)
            pass_preview() {
                printf "%s\n" "$decrypted_file" | head -n 4 \
                        | sed '1 s/^.*$/***/' \
                    && [ "$(printf "%s\n" "$decrypted_file" | wc -l)" -gt 4 ] \
                    && printf "\n***"
                exit 0
            }

            decrypted_file="$(gpg --decrypt "$file_path")" \
                || exit 1

            printf "%s\n" "$(cd "$(dirname "$file_path")" \
                    && pwd -P)/$(basename "$file_path")" \
                | grep -q "password-store" \
                    && pass_preview

            printf "%s\n" "$decrypted_file" \
                && exit 0
            ;;
    esac
}

handle_mime() {
    case "$mime_type" in
        */csv)
            column --separator '	;,' --table "$file_path" \
                && exit 0
            exit 2
            ;;
        *sqlite3)
            sqlite3 -readonly -header -column "$file_path" \
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
        */x-executable | */x-pie-executable | */x-sharedlib | */x-object)
            readelf --wide --demangle --all "$file_path" \
                && exit 0
            exit 1
            ;;
        text/troff)
            man "$file_path" \
                && exit 0
            exit 2
            ;;
        text/* | message/* | */mbox | */javascript | */json | */xml \
            | */x-pem-file | */x-wine-extension-ini | */x-mpegurl \
            | */x-avm-export)
                highlight --max-size=1M "$file_path" \
                    && exit 0
                exit 2
            ;;
    esac
}

handle_fallback() {
    printf "##### File Type Classification #####\n"
    printf "MIME-Type: %s\n" "$mime_type"
    file --dereference --brief "$file_path"
    printf "\n##### Exif Information #####\n"
    exiftool "$file_path"
    exit 0
}

[ "$preview_image" = 'True' ] \
    && handle_image
handle_extension
handle_mime
handle_fallback
