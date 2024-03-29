create database if not exists mixcomne_mixcom;

use mixcomne_mixcom;

create table `users` (
`id` int unsigned not null auto_increment primary key, 
`name` varchar(191) not null, 
`telefone` varchar(191) not null, 
`email` varchar(191) not null, 
`email_verified_at` timestamp null, 
`password` varchar(191) not null, 
`remember_token` varchar(100) null, 
`created_at` timestamp null, 
`updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `users` add unique `users_email_unique`(`email`);

create table `password_resets` (
`email` varchar(191) not null, 
`token` varchar(191) not null, 
`created_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `password_resets` add index `password_resets_email_index`(`email`);

create table `cupom_descontos` (
`id` int unsigned not null auto_increment primary key, 
`nome` varchar(191) not null, 
`localizador` varchar(191) not null, 
`desconto` decimal(6, 2) not null default '0', 
`modo_desconto` enum('valor', 'porc') not null default 'porc', 
`limite` decimal(6, 2) not null default '0', 
`modo_limite` enum('valor', 'qtd') not null default 'qtd', 
`dthr_validade` datetime not null, 
`ativo` enum('S', 'N') not null default 'S', 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `cupom_descontos` add unique `cupom_descontos_localizador_unique`(`localizador`);

create table `enderecos` (
`rua` varchar(191) not null, 
`cidade` varchar(191) not null, 
`bairro` varchar(191) not null, 
`numero` int not null, 
`complemento` varchar(191) null, 
`uf` varchar(191) not null, 
`cep` varchar(191) not null, 
`user_id` int unsigned not null auto_increment primary key, 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `enderecos` add constraint `enderecos_user_id_foreign` foreign key (`user_id`) references `users` (`id`);

create table `categorias` (
`id` int unsigned not null auto_increment primary key, 
`nome` varchar(191) not null, 
`created_at` timestamp null, 
`updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

create table `produtos` (
`id` int unsigned not null auto_increment primary key, 
`nome_produto` varchar(191) not null, 
`tipo` varchar(191) not null, 
`codtipo` varchar(191) not null, 
`marca` varchar(191) not null, 
`valor` decimal(6, 2) not null, 
`descricao` text not null, 
`imagem` varchar(191) not null, 
`caracteristica` text not null, 
`peso` varchar(191) null, 
`altura` varchar(191) null, 
`largura` varchar(191) null, 
`comprimento` varchar(191) null, 
`diametro` varchar(191) null, 
`ativo` enum('S', 'N') not null default 'S', 
`categoria_id` int unsigned not null, 
`remember_token` varchar(100) null, 
`created_at` timestamp null, 
`updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `produtos` add constraint `produtos_categoria_id_foreign` foreign key (`categoria_id`) references `categorias` (`id`);

create table `pedidos` (
`id` int unsigned not null auto_increment primary key, 
`user_id` int unsigned not null, 
`status` enum('RE', 'PA', 'CA', 'PE') not null, 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `pedidos` add constraint `pedidos_user_id_foreign` foreign key (`user_id`) references `users` (`id`);

create table `pedido_produtos` (
`id` int unsigned not null auto_increment primary key, 
`pedido_id` int unsigned not null, 
`produto_id` int unsigned not null, 
`status` enum('RE', 'PA', 'CA', 'PE') not null, 
`valor` int not null default '0', 
`desconto` decimal(6, 2) not null default '0', 
`cupom_desconto_id` int unsigned null, 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `pedido_produtos` add constraint `pedido_produtos_pedido_id_foreign` foreign key (`pedido_id`) references `pedidos` (`id`);

alter table `pedido_produtos` add constraint `pedido_produtos_produto_id_foreign` foreign key (`produto_id`) references `produtos` (`id`);

alter table `pedido_produtos` add constraint `pedido_produtos_cupom_desconto_id_foreign` foreign key (`cupom_desconto_id`) references `cupom_descontos` (`id`);

alter table `categorias` add `deleted_at` timestamp null;

create table `userfis` (
`cpf` varchar(191) not null, 
`user_id` int unsigned not null, 
`id` int unsigned not null auto_increment primary key, 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `userfis` add constraint `userfis_user_id_foreign` foreign key (`user_id`) references `users` (`id`);

alter table `userfis` add unique `userfis_cpf_unique`(`cpf`);

create table `userjurs` (
`id` int unsigned not null auto_increment primary key, 
`rsocial` varchar(191) not null, 
`cnpj` varchar(191) not null, 
`user_id` int unsigned not null, 
`remember_token` varchar(100) null, 
`created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `userjurs` add constraint `userjurs_user_id_foreign` foreign key (`user_id`) references `users` (`id`);

alter table `userjurs` add unique `userjurs_rsocial_unique`(`rsocial`);

alter table `userjurs` add unique `userjurs_cnpj_unique`(`cnpj`);

create table `admins` (
`id` int unsigned not null auto_increment primary key, 
`name` varchar(191) not null, 
`email` varchar(191) not null, 
`password` varchar(191) not null, 
`created_at` timestamp null, 
`updated_at` timestamp null) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

alter table `admins` add unique `admins_email_unique`(`email`);
