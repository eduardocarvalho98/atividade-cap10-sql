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
