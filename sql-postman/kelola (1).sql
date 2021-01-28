-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jan 2021 pada 17.32
-- Versi server: 10.1.21-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelola`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isbn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_page` int(11) NOT NULL,
  `rack_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book`
--

INSERT INTO `book` (`id`, `isbn`, `title`, `author`, `total_page`, `rack_id`, `categories`, `created_at`, `updated_at`) VALUES
(1, '011', 'Cara Mudah Mengedit Robot', 'Yusep', 90, '4', '[2,3]', '2021-01-25 19:27:13', '2021-01-25 19:27:13'),
(2, '012', 'Tentang Sastra', 'Andri', 70, '6', '[4,5]', '2021-01-25 19:31:57', '2021-01-25 19:31:57'),
(3, '013', 'Tentang Sastra', 'Andri', 70, '6', '[4,5]', '2021-01-28 09:30:38', '2021-01-28 09:30:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categori`
--

CREATE TABLE `categori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categori`
--

INSERT INTO `categori` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Komputer', '2021-01-25 19:14:07', '2021-01-28 09:25:28'),
(3, 'keilmuan', '2021-01-25 19:15:50', '2021-01-25 19:15:50'),
(4, 'pendidikan', '2021-01-25 19:15:56', '2021-01-25 19:15:56'),
(5, 'bahasa', '2021-01-25 19:16:01', '2021-01-25 19:16:01'),
(6, 'bahasa', '2021-01-26 01:05:40', '2021-01-26 01:05:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_01_26_000643_create_book_table', 2),
(10, '2021_01_26_000910_create_rack_table', 2),
(11, '2021_01_26_001127_create_categori_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0d11ae36ed7429ba64a11af98bcf0a1ba75eac46cb28f936e1e49b2455820027839aa64c27058dc4', 1, 1, 'jF6uS4DgedIkojrHq0wmaWgkoZ32bmgVcuXQcteJmtCiXrE45eVxIZjBGqqM', '[]', 0, '2021-01-26 00:49:09', '2021-01-26 00:49:09', '2022-01-26 07:49:09'),
('0f8603540f9e2c9830ae0e7eeff534da6b9e43937442f637f6b669615fb87a0654289ee8e61a28f0', 1, 1, 'remember_token', '[]', 0, '2021-01-25 16:16:04', '2021-01-25 16:16:04', '2022-01-25 23:16:04'),
('14b73aa78aaae7872dd4a59976e636462935ec77c01bf626094501c71eca2c0f4b7848e4bfc73625', 2, 1, 'MyToken', '[]', 0, '2021-01-25 01:25:19', '2021-01-25 01:25:19', '2022-01-25 08:25:19'),
('17fedad95457d06425ded31a5439556d6b9db0aedac960e32ec50c6c3ea36e1b1dd238e31fe2cc3f', 2, 1, 'PE2qUW65yN4BMoYOcCNEUaRAKl3BxilhOJ7eIagS3WDVSuwo1mH1eRbHLPCZ', '[]', 0, '2021-01-25 16:18:12', '2021-01-25 16:18:12', '2022-01-25 23:18:12'),
('26e24459a87eeaaf22a4b94f204c7479b96d735c919838f01fb12ce8a5c0d33514c0e8f6f84cb288', 1, 1, 'LaravelAuthApp', '[]', 0, '2021-01-26 00:45:28', '2021-01-26 00:45:28', '2022-01-26 07:45:28'),
('317c50f936252cf1c1c651e3a7e6b0ab58d834aaab580014c745369699b822daec76ff30c172bffc', 1, 1, 'MyToken', '[]', 0, '2021-01-25 16:21:56', '2021-01-25 16:21:56', '2022-01-25 23:21:56'),
('351e958d04c1acf27982a72eb59c41b13552ee84e7eb54ab6147de77a52e87b14b3a217194d8405d', 1, 1, 'MyToken', '[]', 0, '2021-01-26 01:00:59', '2021-01-26 01:00:59', '2022-01-26 08:00:59'),
('3dee82aa0a8d2457f29907310f3e5984194716607b05dba1dfb57afe7c6038aea332e7db83eee7d3', 2, 1, 'MyToken', '[]', 0, '2021-01-25 00:59:14', '2021-01-25 00:59:14', '2022-01-25 07:59:14'),
('4c54f9c1d71498cb8daf9ceb42a3b0357e767daa748841505d38b9957d839ee5bf62f6f551a49f26', 5, 1, 'MyToken', '[]', 0, '2021-01-25 15:45:45', '2021-01-25 15:45:45', '2022-01-25 22:45:45'),
('51755426698d439b2b18b134a8f73629f7ec295963965bfd1bfb6ba9d5242c4b1a83e2483dd59890', 2, 1, 'MyToken', '[]', 0, '2021-01-25 01:01:23', '2021-01-25 01:01:23', '2022-01-25 08:01:23'),
('52a63bd6a17e39bb152e8f95b7b3c65b20aa0ec829d92d05b84b763983dc72dd5a853add9da7db64', 2, 1, 'MyToken', '[]', 0, '2021-01-25 01:27:25', '2021-01-25 01:27:25', '2022-01-25 08:27:25'),
('748624b71e8e1d9845e9c7837685ebdd31e2d1585e5be45a312fdaa20b1bb1d4f04801995da9462d', 2, 1, 'MyToken', '[]', 0, '2021-01-25 01:01:47', '2021-01-25 01:01:47', '2022-01-25 08:01:47'),
('78394626bde674027a3afadf1f872d34a78bddcdeac543bec098c23346caabda6797f31966986249', 5, 1, 'MyToken', '[]', 0, '2021-01-25 15:49:01', '2021-01-25 15:49:01', '2022-01-25 22:49:01'),
('970bdf3dfc2f863fea78a652cb36e0343bb0216765987f0382d13af4f337719fa5859b9bb32a923e', 2, 1, 'MyToken', '[]', 0, '2021-01-25 00:54:39', '2021-01-25 00:54:39', '2022-01-25 07:54:39'),
('a800b8e4cee606c966bf7d25ee5424da4fc2a0f6d504684b5448f3794c3b69651a62279706799eb2', 2, 1, 'MyToken', '[]', 0, '2021-01-25 15:48:47', '2021-01-25 15:48:47', '2022-01-25 22:48:47'),
('b2b61ea52409b4641d3d43aa2418edaa26471ae23ee5c83d4bb7d39d2639e2a729d0ae9de8b7b69b', 2, 1, 'MyToken', '[]', 0, '2021-01-25 01:25:26', '2021-01-25 01:25:26', '2022-01-25 08:25:26'),
('b5830342c808ab9ccd9152b6ba6164355f8e54b161a9f30a73593a1ef44bd7ca00a261a4a0e8fade', 1, 1, 'LaravelAuthApp', '[]', 0, '2021-01-26 00:48:11', '2021-01-26 00:48:11', '2022-01-26 07:48:11'),
('bee9435fc94586fded32c668fde5b393474fb9a624b4ad9cb6bd83aab40733c008032baca6227b72', 2, 1, 'MyToken', '[]', 0, '2021-01-25 00:06:56', '2021-01-25 00:06:56', '2022-01-25 07:06:56'),
('d3c4ee981e06c97e5fd67a7ebcf6034710ff0ad191dc096758a6c8f12ad068bac04fa70b027fbfb5', 1, 1, 'MyToken', '[]', 0, '2021-01-28 08:10:57', '2021-01-28 08:10:57', '2022-01-28 15:10:57'),
('dde82b867d8172de9c3f26f7fb96499d0e96c74de5a29a7d66d5df12628591ad9e097056be3869a2', 5, 1, 'MyToken', '[]', 0, '2021-01-25 15:49:41', '2021-01-25 15:49:41', '2022-01-25 22:49:41'),
('e69df1d71a76331b1b8ea87747171ea65b44088d4275a3be4326ca881378f1528c4a066688367fa7', 1, 1, 'remember_token', '[]', 0, '2021-01-25 16:21:27', '2021-01-25 16:21:27', '2022-01-25 23:21:27'),
('f18d9e44fc355108b3d49a7956ba60987c7cf4b9fb7c5b0fd61f04cf8416d4197c7d938ea81efe91', 2, 1, 'MyToken', '[]', 0, '2021-01-25 00:59:01', '2021-01-25 00:59:01', '2022-01-25 07:59:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '411JHKiDZlofMDTOs9y8luniLDVdeJq2Id1eUNrt', NULL, 'http://localhost', 1, 0, 0, '2021-01-24 22:58:17', '2021-01-24 22:58:17'),
(2, NULL, 'Laravel Password Grant Client', 'KYni1yQSrZApqxLNAbQ6Ddd0eet5saxbrXsFDyak', 'users', 'http://localhost', 0, 1, 0, '2021-01-24 22:58:18', '2021-01-24 22:58:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-24 22:58:18', '2021-01-24 22:58:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('didinmaulana099@gmail.com', 'adjPenvKSNTQ', NULL),
('didinmaulana099@gmail.com', 'RpHZDCz177ZV', NULL),
('didin@gmail.com', 'ivunK3vG3UMM', NULL),
('didin@gmail.com', 'CNVMvmHjT9su', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rack`
--

CREATE TABLE `rack` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rack`
--

INSERT INTO `rack` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'besar', '2021-01-25 19:16:48', '2021-01-25 19:16:48'),
(5, 'kecil', '2021-01-25 19:16:54', '2021-01-25 19:16:54'),
(6, 'sedang', '2021-01-25 19:16:59', '2021-01-25 19:16:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `token_password`, `created_at`, `updated_at`) VALUES
(1, 'didin', 'didinmaulana099@gmail.com', NULL, '$2y$10$nWzM5FQY9lMqJIzx7LFw7eqo2SugVPlq9U29keGqg9FpyCBk1M.U.', '', 'PTqmw2LUhikqOR0X3vkhUARoep3DwYleT6iAd0J4u921oUWZYZOp4g5JCo8U', 'RpHZDCz177ZV', '2021-01-25 16:21:27', '2021-01-28 08:54:16'),
(2, 'didin', 'didin@gmail.com', NULL, '$2y$10$FFOABgFrdycyhnyLQC5w/uRyYiqwNhQZM8EcLA/o02D93nOvLxD1y', 'OtWi5hzTHAR5Sxy6netxkKqxZQqNjLQg0SekdTYspPravjVQdWLQqh0pG1fY', NULL, 'CNVMvmHjT9su', '2021-01-28 08:57:38', '2021-01-28 09:23:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categori`
--
ALTER TABLE `categori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `rack`
--
ALTER TABLE `rack`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `book`
--
ALTER TABLE `book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `categori`
--
ALTER TABLE `categori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rack`
--
ALTER TABLE `rack`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
