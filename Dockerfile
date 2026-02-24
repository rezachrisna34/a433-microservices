# Menggunakan base image Node.js versi 14 sesuai kriteria
FROM node:14

# Menentukan working directory di dalam container
WORKDIR /app

# Menyalin seluruh source code dari lokal ke working directory container
COPY . .

# Menentukan mode aplikasi (production) dan database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies production dan mem-build aplikasi
# --unsafe-perm mencegah masalah permission saat install package
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 agar bisa diakses dari luar container
EXPOSE 8080

# Perintah utama untuk menjalankan aplikasi saat container diluncurkan
CMD ["npm", "start"]
