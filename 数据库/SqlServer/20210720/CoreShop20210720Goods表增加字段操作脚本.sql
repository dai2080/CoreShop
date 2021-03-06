/*
   2021年7月20日19:46:08
   用户: coreshop
   服务器: 127.0.0.1
   数据库: CoreShop
   应用程序: 
*/

/* 为了防止任何可能出现的数据丢失问题，您应该先仔细检查此脚本，然后再在数据库设计器的上下文之外运行此脚本。*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CoreCmsGoods
	DROP CONSTRAINT DF_CoreCmsGoods_productsDistributionType
GO
ALTER TABLE dbo.CoreCmsGoods
	DROP CONSTRAINT DF_CoreCmsGoods_commentsCount
GO
ALTER TABLE dbo.CoreCmsGoods
	DROP CONSTRAINT DF_CoreCmsGoods_viewCount
GO
ALTER TABLE dbo.CoreCmsGoods
	DROP CONSTRAINT DF_CoreCmsGoods_buyCount
GO
ALTER TABLE dbo.CoreCmsGoods
	DROP CONSTRAINT DF_CoreCmsGoods_openSpec
GO
CREATE TABLE dbo.Tmp_CoreCmsGoods
	(
	id int NOT NULL IDENTITY (1, 1),
	bn nvarchar(30) NOT NULL,
	name nvarchar(200) NOT NULL,
	brief nvarchar(255) NULL,
	image nvarchar(255) NULL,
	images nvarchar(MAX) NULL,
	video nvarchar(255) NULL,
	productsDistributionType int NOT NULL,
	goodsCategoryId int NOT NULL,
	goodsTypeId int NOT NULL,
	goodsSkuIds nvarchar(255) NULL,
	goodsParamsIds nvarchar(255) NULL,
	brandId int NOT NULL,
	isNomalVirtual bit NOT NULL,
	isMarketable bit NOT NULL,
	unit nvarchar(20) NULL,
	intro nvarchar(MAX) NULL,
	spesDesc nvarchar(MAX) NULL,
	parameters nvarchar(MAX) NULL,
	commentsCount int NOT NULL,
	viewCount int NOT NULL,
	buyCount int NOT NULL,
	uptime datetime NULL,
	downtime datetime NULL,
	sort int NOT NULL,
	labelIds nvarchar(50) NULL,
	newSpec nvarchar(MAX) NULL,
	openSpec int NOT NULL,
	createTime datetime NULL,
	updateTime datetime NULL,
	isRecommend bit NOT NULL,
	isHot bit NOT NULL,
	isDel bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods SET (LOCK_ESCALATION = TABLE)
GO
DECLARE @v sql_variant 
SET @v = N'商品表'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', NULL, NULL
GO
DECLARE @v sql_variant 
SET @v = N'商品ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'id'
GO
DECLARE @v sql_variant 
SET @v = N'商品条码'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'bn'
GO
DECLARE @v sql_variant 
SET @v = N'商品名称'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'name'
GO
DECLARE @v sql_variant 
SET @v = N'商品简介'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'brief'
GO
DECLARE @v sql_variant 
SET @v = N'缩略图'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'image'
GO
DECLARE @v sql_variant 
SET @v = N'图集'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'images'
GO
DECLARE @v sql_variant 
SET @v = N'视频'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'video'
GO
DECLARE @v sql_variant 
SET @v = N'佣金分配方式'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'productsDistributionType'
GO
DECLARE @v sql_variant 
SET @v = N'商品分类'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'goodsCategoryId'
GO
DECLARE @v sql_variant 
SET @v = N'商品类别'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'goodsTypeId'
GO
DECLARE @v sql_variant 
SET @v = N'sku序列'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'goodsSkuIds'
GO
DECLARE @v sql_variant 
SET @v = N'参数序列'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'goodsParamsIds'
GO
DECLARE @v sql_variant 
SET @v = N'品牌'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'brandId'
GO
DECLARE @v sql_variant 
SET @v = N'是否虚拟商品'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'isNomalVirtual'
GO
DECLARE @v sql_variant 
SET @v = N'是否上架'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'isMarketable'
GO
DECLARE @v sql_variant 
SET @v = N'商品单位'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'unit'
GO
DECLARE @v sql_variant 
SET @v = N'商品详情'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'intro'
GO
DECLARE @v sql_variant 
SET @v = N'商品规格序列号存储'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'spesDesc'
GO
DECLARE @v sql_variant 
SET @v = N'参数序列化'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'parameters'
GO
DECLARE @v sql_variant 
SET @v = N'评论次数'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'commentsCount'
GO
DECLARE @v sql_variant 
SET @v = N'浏览次数'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'viewCount'
GO
DECLARE @v sql_variant 
SET @v = N'购买次数'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'buyCount'
GO
DECLARE @v sql_variant 
SET @v = N'上架时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'uptime'
GO
DECLARE @v sql_variant 
SET @v = N'下架时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'downtime'
GO
DECLARE @v sql_variant 
SET @v = N'商品排序'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'sort'
GO
DECLARE @v sql_variant 
SET @v = N'标签id逗号分隔'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'labelIds'
GO
DECLARE @v sql_variant 
SET @v = N'自定义规格名称'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'newSpec'
GO
DECLARE @v sql_variant 
SET @v = N'开启规则'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'openSpec'
GO
DECLARE @v sql_variant 
SET @v = N'创建时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'createTime'
GO
DECLARE @v sql_variant 
SET @v = N'更新时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'updateTime'
GO
DECLARE @v sql_variant 
SET @v = N'是否推荐'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'isRecommend'
GO
DECLARE @v sql_variant 
SET @v = N'是否热门'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'isHot'
GO
DECLARE @v sql_variant 
SET @v = N'是否删除'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_CoreCmsGoods', N'COLUMN', N'isDel'
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods ADD CONSTRAINT
	DF_CoreCmsGoods_productsDistributionType DEFAULT ((1)) FOR productsDistributionType
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods ADD CONSTRAINT
	DF_CoreCmsGoods_commentsCount DEFAULT ((0)) FOR commentsCount
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods ADD CONSTRAINT
	DF_CoreCmsGoods_viewCount DEFAULT ((0)) FOR viewCount
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods ADD CONSTRAINT
	DF_CoreCmsGoods_buyCount DEFAULT ((0)) FOR buyCount
GO
ALTER TABLE dbo.Tmp_CoreCmsGoods ADD CONSTRAINT
	DF_CoreCmsGoods_openSpec DEFAULT ((0)) FOR openSpec
GO
SET IDENTITY_INSERT dbo.Tmp_CoreCmsGoods ON
GO
IF EXISTS(SELECT * FROM dbo.CoreCmsGoods)
	 EXEC('INSERT INTO dbo.Tmp_CoreCmsGoods (id, bn, name, brief, image, images, video, productsDistributionType, goodsCategoryId, goodsTypeId, brandId, isNomalVirtual, isMarketable, unit, intro, spesDesc, parameters, commentsCount, viewCount, buyCount, uptime, downtime, sort, labelIds, newSpec, openSpec, createTime, updateTime, isRecommend, isHot, isDel)
		SELECT id, bn, name, brief, image, images, video, productsDistributionType, goodsCategoryId, goodsTypeId, brandId, isNomalVirtual, isMarketable, unit, intro, spesDesc, parameters, commentsCount, viewCount, buyCount, uptime, downtime, sort, labelIds, newSpec, openSpec, createTime, updateTime, isRecommend, isHot, isDel FROM dbo.CoreCmsGoods WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_CoreCmsGoods OFF
GO
DROP TABLE dbo.CoreCmsGoods
GO
EXECUTE sp_rename N'dbo.Tmp_CoreCmsGoods', N'CoreCmsGoods', 'OBJECT' 
GO
ALTER TABLE dbo.CoreCmsGoods ADD CONSTRAINT
	PK__corecms___3213E83FEDFA7292 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX isdel ON dbo.CoreCmsGoods
	(
	isDel
	) WITH( STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX is_hot ON dbo.CoreCmsGoods
	(
	isHot
	) WITH( STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX is_recommend ON dbo.CoreCmsGoods
	(
	isRecommend
	) WITH( STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX sort ON dbo.CoreCmsGoods
	(
	sort
	) WITH( STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
COMMIT
