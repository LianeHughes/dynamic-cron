export CODE_PATH=/code

python "$CODE_PATH"/gen_ww_slu_logyaxis.py > "$CODE_PATH"/output/wastewater_combined_slu_logyaxis.json
python "$CODE_PATH"/gen_ww_slu_regular.py > "$CODE_PATH"/output/wastewater_combined_slu_regular.json
python "$CODE_PATH"/gen_ww_stockholm_logyaxis.py > "$CODE_PATH"/output/wastewater_stockholm_logyaxis.json
python "$CODE_PATH"/gen_ww_stockholm_regular.py > "$CODE_PATH"/output/wastewater_combined_stockholm.json

# Upload generated files
for filename in $(ls $CODE_PATH/output) ; do
    curl "https://blobserver.dckube.scilifelab.se/blob/$filename" -H "x-accesskey: $ACCESS_KEY" --upload-file "output/$filename"
done
