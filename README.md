# Submission 1: Prediksi Penyakit Jantung
Nama: Yulianto Aryaseta

Username dicoding: yulianto_aryaseta

| | Deskripsi |
| ----------- | ----------- |
| Dataset | [Heart Failure Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction). Dataset gabungan dari 5 sumber (Cleveland, Hungarian, Switzerland, Long Beach VA, dan Stalog) dengan total 1.190 data pasien dan 11 fitur umum. Fitur numerik: Age, RestingBP, Cholesterol, FastingBS, MaxHR, Oldpeak. Fitur kategorikal: Sex, ChestPainType, RestingECG, ExerciseAngina, ST_Slope. Target: HeartDisease (1 = ada penyakit jantung, 0 = tidak). |
| Masalah | Memprediksi risiko penyakit jantung berdasarkan data klinis pasien seperti tekanan darah, kolesterol, detak jantung maksimum, dan parameter kesehatan lainnya untuk deteksi dini penyakit jantung. |
| Solusi machine learning | Membangun model klasifikasi biner menggunakan deep learning untuk mengidentifikasi apakah pasien memiliki risiko penyakit jantung berdasarkan fitur-fitur klinis yang tersedia. |
| Metode pengolahan | Menggunakan TFX Transform untuk pra-pemrosesan data: normalisasi fitur numerik menggunakan teknik scaling dan encoding fitur kategorikal menggunakan vocabulary mapping dan embedding untuk representasi yang lebih baik. |
| Arsitektur model | Model neural network menggunakan Keras dengan arsitektur: input numerik langsung ke dense layer, input kategorikal melalui embedding layer dan flatten. Dua hidden layer (Dense 64 unit dengan aktivasi ReLU dan dropout 0.2 untuk regularisasi), output layer dengan aktivasi sigmoid untuk klasifikasi biner. |
| Metrik evaluasi | Evaluasi performa model menggunakan multiple metrik: akurasi untuk mengukur ketepatan prediksi, binary crossentropy sebagai loss function, precision untuk mengukur ketepatan prediksi positif, recall untuk mengukur kemampuan deteksi kasus positif, dan AUC (Area Under Curve) untuk mengukur kemampuan diskriminasi model. |
| Performa model | Model menunjukkan performa excellent dengan akurasi pelatihan 93.69%, precision 93.19%, recall 95.52%, AUC 98.63%, dan loss 0.1493. Hasil ini menunjukkan model sangat baik dalam mendeteksi penyakit jantung dengan tingkat false negative yang rendah. |
| Opsi deployment | Deployment dilakukan menggunakan platform Railway dengan containerization melalui Dockerfile. Model yang di-deploy langsung menggunakan artifact dari TFX Pusher component yang telah melalui proses validasi. Railway dipilih karena kemudahan integrasi dengan Git, auto-deploy dari repository, dan support untuk containerized applications. |
| Web app | [Model Prediksi Penyakit Jantung](https://mlops-production-fd3b.up.railway.app/v1/models/hd-model/metadata) |
| Monitoring | [Belum diimplementasikan - membutuhkan informasi tentang sistem monitoring model serving seperti tracking drift, latency, dan accuracy over time] |
