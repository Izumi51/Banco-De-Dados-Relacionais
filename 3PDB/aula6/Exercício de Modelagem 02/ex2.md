# Exercício de Modelagem 02
Uma empresa quer um sistema para gerenciar seu
patrimônio móvel. Para isto contratou você e solicitou um projeto. Inicie seu
trabalho construindo um DER capaz de responder da melhor forma possível às
necessidades de informações do cliente. Para ajudar, o gerente do Setor de
Patrimônio da empresa redigiu o texto abaixo, explicando como ele deseja que o
sistema funcione. 

## __Texto Base:__ 
Nossa empresa é organizada em departamentos e este em setores. Cada setor é identificado por uma sigla. Cada departamento é identificado por uma sigla. Cada bem móvel adquirido é identificado fisicamente por uma plaqueta de metal que possui um número de 6 dígitos criado pelo Setor de Patrimônio. Após receber essa identificação, o bem deverá ser cadastrado no sistema. Mais tarde esse bem deverá ficar sob a responsabilidade de um setor da empresa. Estando dentro da empresa um bem pode ser transferido para outro setor, passando automaticamente a ficar sob responsabilidade desse novo setor.

Quando um bem móvel sofre algum tipo de dano é feito o registro de uma ocorrência. Uma ocorrência é, portanto, o registro de um fato acontecido com um bem e originado por um único tipo de dano. Cada ocorrência com um bem móvel deverá ser identificada mediante um número próprio (número de registro de ocorrência), permitindo que saibamos, a qualquer momento, quais foram as ocorrências havidas com um bem.

Os tipos de danos são cadastrados previamente, mesmo antes de alguma ocorrência. Alguns exemplos de tipos de danos são: quebra, furto, extravio, defeito, etc. Surgindo um novo tipo de dano, o sistema deverá permitir seu cadastramento para posterior registro da ocorrência. Algumas informações são importantes que o sistema forneça:
 
__A)__ Dado um bem móvel, qual a sigla e o nome do setor responsável pelo bem.

__B)__ Dado um bem móvel, qual a sigla e o nome do departamento ao qual o setor responsável pelo bem está subordinado.

__C)__ Quais as ocorrências já havidas com um bem móvel e as datas destas ocorrências.

__D)__ Quais os bens móveis existentes na empresa (descrição de cada bem) e respectivos: data de compra e valor da compra.

__E)__ Dado um setor, quais as ocorrências já havidas sob responsabilidade do mesmo.

__F)__ Dada a identificação de um tipo de dano informar: sua descrição e ocorrências causadas pelos mesmos.

# ENTIDADES
1. Departamento
2. Setor
3. 

### 
#### Atributos:
> - ;
> - ;
> - .

### 
#### Atributos:
> - ;
> - ;
> - .

### 
#### Atributos:
> - ;
> - ;
> - .

### 
#### Atributos:
> - ;
> - .

# Logical
![alt text]()
# Relational
![alt text]()