import youtube_dl
import csv

# csv to array
urls = []
csv_path = './target.csv'
with open(csv_path) as f:
    reader = csv.reader(f)
    for row in reader:
        urls.append(str(row[0]))
 
# ydl config
ydl_opts = {
    'format': 'bestaudio/best',
    # 'outtmpl':  "sample_music" + '.%(ext)s',
    'postprocessors': [
        {'key': 'FFmpegExtractAudio',
        'preferredcodec': 'mp3',
         'preferredquality': '192'},
        {'key': 'FFmpegMetadata'},
    ],
}

for i, url in enumerate(urls):
    ydl_opts['outtmpl'] = "download_" + str(i) +'.%(ext)s'
    ydl = youtube_dl.YoutubeDL(ydl_opts)
    info_dict = ydl.extract_info(url, download=True)