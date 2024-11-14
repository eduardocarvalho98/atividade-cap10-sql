# **Projeto de Modelagem de Dados: Análise de Abate de Animais no Brasil**

## **Introdução**

Este projeto tem como objetivo criar um modelo de banco de dados para armazenar informações sobre o abate de animais no Brasil, utilizando dados do IBGE, e outros. O objetivo é permitir análises detalhadas sobre produção e abate por estado e região.

## **Diagrama Entidade-Relacionamento (MER)**

O diagrama MER ilustra as principais entidades do projeto, como **Animal**, **Região**, **Estado**, e **Abate**, além dos relacionamentos entre essas entidades.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/c406f5c4-770a-46c2-92a9-fe1334442201/2736ddc4-e8d7-4974-aca5-174a6b07f9b7/image.png)

```xml
<?xml version="1.0" encoding="utf-8" ?>
<!-- SQL XML created by WWW SQL Designer, https://github.com/ondras/wwwsqldesigner/ -->
<!-- Active URL: https://sql.toad.cz/ -->
<sql>
<datatypes db="mysql">
	<group label="Numeric" color="rgb(238,238,170)">
		<type label="Integer" length="0" sql="INTEGER" quote=""/>
	 	<type label="TINYINT" length="0" sql="TINYINT" quote=""/>
	 	<type label="SMALLINT" length="0" sql="SMALLINT" quote=""/>
	 	<type label="MEDIUMINT" length="0" sql="MEDIUMINT" quote=""/>
	 	<type label="INT" length="0" sql="INT" quote=""/>
		<type label="BIGINT" length="0" sql="BIGINT" quote=""/>
		<type label="Decimal" length="1" sql="DECIMAL" re="DEC" quote=""/>
		<type label="Single precision" length="0" sql="FLOAT" quote=""/>
		<type label="Double precision" length="0" sql="DOUBLE" re="DOUBLE" quote=""/>
	</group>

	<group label="Character" color="rgb(255,200,200)">
		<type label="Char" length="1" sql="CHAR" quote="'"/>
		<type label="Varchar" length="1" sql="VARCHAR" quote="'"/>
		<type label="Text" length="0" sql="MEDIUMTEXT" re="TEXT" quote="'"/>
		<type label="Binary" length="1" sql="BINARY" quote="'"/>
		<type label="Varbinary" length="1" sql="VARBINARY" quote="'"/>
		<type label="BLOB" length="0" sql="BLOB" re="BLOB" quote="'"/>
	</group>

	<group label="Date &amp; Time" color="rgb(200,255,200)">
		<type label="Date" length="0" sql="DATE" quote="'"/>
		<type label="Time" length="0" sql="TIME" quote="'"/>
		<type label="Datetime" length="0" sql="DATETIME" quote="'"/>
		<type label="Year" length="0" sql="YEAR" quote=""/>
		<type label="Timestamp" length="0" sql="TIMESTAMP" quote="'"/>
	</group>
	
	<group label="Miscellaneous" color="rgb(200,200,255)">
		<type label="ENUM" length="1" sql="ENUM" quote=""/>
		<type label="SET" length="1" sql="SET" quote=""/>
		<type label="Bit" length="0" sql="bit" quote=""/>
	</group>
</datatypes><table x="247" y="217" name="dm_animal">
<row name="animal_id" null="1" autoincrement="1">
<datatype>INT</datatype>
<default>NULL</default></row>
<row name="tipo_animal" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>animal_id</part>
</key>
</table>
<table x="476" y="226" name="dm_regiao">
<row name="regiao_id" null="1" autoincrement="1">
<datatype>INT</datatype>
<default>NULL</default></row>
<row name="nome_regiao" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>regiao_id</part>
</key>
</table>
<table x="737" y="247" name="dm_uf">
<row name="estado_id" null="1" autoincrement="1">
<datatype>INT</datatype>
<default>NULL</default></row>
<row name="nome_estado" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="regiao_id" null="1" autoincrement="0">
<datatype>INT</datatype>
<default>NULL</default><relation table="dm_regiao" row="regiao_id" />
</row>
<key type="PRIMARY" name="">
<part>estado_id</part>
</key>
</table>
<table x="443" y="361" name="dm_abate">
<row name="abate_id" null="1" autoincrement="1">
<datatype>INT</datatype>
<default>NULL</default></row>
<row name="animal_id" null="1" autoincrement="0">
<datatype>INT</datatype>
<default>NULL</default><relation table="dm_animal" row="animal_id" />
</row>
<row name="estado_id" null="1" autoincrement="0">
<datatype>INT</datatype>
<default>NULL</default><relation table="dm_uf" row="estado_id" />
</row>
<row name="trimestre" null="1" autoincrement="0">
<datatype>DATE</datatype>
<default>NULL</default></row>
<row name="ano" null="1" autoincrement="0">
<datatype>YEAR</datatype>
<default>NULL</default></row>
<row name="num_informants" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="qtd_abtd" null="1" autoincrement="0">
<datatype>INT</datatype>
<default>NULL</default></row>
<row name="peso_carcacas" null="1" autoincrement="0">
<datatype>DECIMAL</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>abate_id</part>
</key>
</table>
</sql>

```

## **Modelo Relacional**

O modelo relacional é uma representação física das tabelas no banco de dados, que inclui as tabelas `dm_animal`, `dm_regiao`, `dm_uf`, e `dm_abate`.

---

## **Consultas SQL**

Aqui estão alguns exemplos de consultas SQL para análise dos dados:

### **1. Total de abates de bovinos por região no 2º Trimestre de 2024**

```sql
sql
SELECT r.nome_regiao, SUM(a.qtd_abtd) AS total_bovinos_abatidos
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
JOIN dm_regiao r ON e.regiao_id = r.regiao_id
WHERE a.animal_id = 1 AND a.trimestre = '2º Trimestre' AND a.ano = 2024
GROUP BY r.nome_regiao;

```

### **2. Peso total das carcaças de frangos por estado**

```sql
sql
SELECT e.nome_estado, SUM(a.peso_carcacas) AS total_peso_carcacas
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
WHERE a.animal_id = 3
GROUP BY e.nome_estado
ORDER BY total_peso_carcacas DESC;

```

### **3. Estados com maior número de informantes para abate de suínos**

```sql
sql
SELECT e.nome_estado, SUM(a.num_informants) AS total_informantes
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
WHERE a.animal_id = 2
GROUP BY e.nome_estado
ORDER BY total_informantes DESC
LIMIT 5;

```

---

## **Dicionário de Dados**

**Tabela: dm_animal**

- `animal_id`: Identificador único do tipo de animal
- `tipo_animal`: Nome do animal (Bovinos, Suínos, Frangos)

**Tabela: dm_regiao**

- `regiao_id`: Identificador único da região
- `nome_regiao`: Nome da região

**Tabela: dm_uf**

- `estado_id`: Identificador único do estado
- `nome_estado`: Nome do estado
- `regiao_id`: Identificador da região

**Tabela: dm_abate**

- `abate_id`: Identificador único do registro de abate
- `animal_id`: Referência ao tipo de animal
- `estado_id`: Referência ao estado
- `trimestre`: Trimestre do abate
- `ano`: Ano do abate
- `num_informants`: Número de informantes
- `qtd_abtd`: Quantidade de animais abatidos
- `peso_carcacas`: Peso total das carcaças (kg)

---

## **Conclusão**

O projeto foi desenvolvido com o objetivo de criar um modelo robusto que permita a análise detalhada dos dados de abate no Brasil. A modelagem foi realizada de forma a garantir a integridade e eficiência do banco de dados, permitindo consultas rápidas e precisas para gerar insights sobre a produção agrícola no país.