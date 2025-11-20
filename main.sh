#!/bin/bash

output="word_documents.txt"

# очистить файл
> "$output"

total_words=0
total_chars=0
total_files=0

for f in *.txt; do
    # пропустить, если файлов нет
    [ -e "$f" ] || continue

    total_files=$((total_files + 1))

    words=$(wc -w < "$f")
    chars=$(wc -m < "$f")

    total_words=$((total_words + words))
    total_chars=$((total_chars + chars))

    echo "Файл: $f" >> "$output"
    echo "Слов: $words" >> "$output"
    echo "Символов: $chars" >> "$output"
    echo "" >> "$output"
done

echo "==========================" >> "$output"
echo "ИТОГО:" >> "$output"
echo "Всего файлов: $total_files" >> "$output"
echo "Всего слов: $total_words" >> "$output"
echo "Всего символов: $total_chars" >> "$output"
