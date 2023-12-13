CREATE DATABASE TotalBite;
USE TotalBite;

-- Tabel Menu
CREATE TABLE IF NOT EXISTS Menu (
    idMenu INT PRIMARY KEY AUTO_INCREMENT,
    namaMenu VARCHAR(50) NOT NULL,
    hargaMenu DOUBLE NOT NULL,
    jenisMenu ENUM('Makanan', 'Minuman') NOT NULL
);

-- Tabel Pesanan
CREATE TABLE IF NOT EXISTS Pesanan (
    idPesanan INT PRIMARY KEY AUTO_INCREMENT,
    nomerOrder INT NOT NULL,
    namaPemesan VARCHAR(50) NOT NULL,
    tglTransaksi DATE NOT NULL,
    waktuTransaksi TIME NOT NULL DEFAULT '00:00:00', -- Default value added
    idMenuMakanan INT,
    idMenuMinuman INT,
    jumlahPesanMakanan INT NOT NULL,
    jumlahPesanMinuman INT NOT NULL,
    harga DOUBLE NOT NULL,
    subtotal DOUBLE NOT NULL,
    pajak DOUBLE NOT NULL,
    total DOUBLE NOT NULL,
    uangBayar DOUBLE NOT NULL,
    kembalian DOUBLE NOT NULL,
    FOREIGN KEY (idMenuMakanan) REFERENCES Menu(idMenu),
    FOREIGN KEY (idMenuMinuman) REFERENCES Menu(idMenu)
);

-- Tabel Transaksi
CREATE TABLE IF NOT EXISTS Transaksi (
    idTransaksi INT PRIMARY KEY AUTO_INCREMENT,
    nomerOrder INT NOT NULL,
    namaPemesan VARCHAR(50) NOT NULL,
    tglTransaksi DATE NOT NULL,
    waktuTransaksi TIME NOT NULL,
    idPesanan INT,
    subtotal DOUBLE NOT NULL,
    pajak DOUBLE NOT NULL,
    total DOUBLE NOT NULL,
    uangBayar DOUBLE NOT NULL,
    kembalian DOUBLE NOT NULL,
    FOREIGN KEY (idPesanan) REFERENCES Pesanan(idPesanan)
);

-- Tabel Receipt
CREATE TABLE IF NOT EXISTS Receipt (
    nomerOrder INT PRIMARY KEY,
    namaPemesan VARCHAR(50) NOT NULL,
    makanan VARCHAR(50) NOT NULL,
    minuman VARCHAR(50) NOT NULL,
    totalBayar DOUBLE NOT NULL,
    uangBayar DOUBLE NOT NULL,
    kembalian DOUBLE NOT NULL,
    tglTransaksi DATE NOT NULL,
    waktuTransaksi TIME NOT NULL
);

-- Menambahkan Data ke Tabel Menu
INSERT INTO Menu (namaMenu, hargaMenu, jenisMenu) VALUES
    ('Bakso', 12000, 'Makanan'),
    ('Mie Ayam', 10000, 'Makanan'),
    ('Nasi Goreng', 12000, 'Makanan'),
    ('Ayam Bakar', 15000, 'Makanan'),
    ('Soto', 14000, 'Makanan'),
    ('Es Jeruk', 6000, 'Minuman'),
    ('Es Teh', 6000, 'Minuman'),
    ('Teh Hangat', 6000, 'Minuman'),
    ('Air Mineral', 5000, 'Minuman'),
    ('Nutrisari', 6000, 'Minuman');

-- Menampilkan Data dengan Format Uang
SELECT nomerOrder, namaPemesan, makanan, minuman, CONCAT('Rp', FORMAT(totalBayar, 0)) AS totalBayar, CONCAT('Rp', FORMAT(uangBayar, 0)) AS uangBayar, CONCAT('Rp', FORMAT(kembalian, 0)) AS kembalian, tglTransaksi, waktuTransaksi
FROM Receipt;