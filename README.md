# Pointer - Sistema de Gestão de Recursos Humanos

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

Sistema completo de gestão de Recursos Humanos desenvolvido em Ruby on Rails para otimizar processos de departamento pessoal, controle de funcionários e gerenciamento de chamados técnicos.

## 🚀 Funcionalidades

### 👥 Gestão de Funcionários
- **Cadastro completo** de colaboradores com todos os dados necessários
- **Controle de status** (Ativo, Inativo, Férias)
- **Cálculo automático** de tempo de empresa
- **Histórico completo** de informações profissionais
- **Filtros e buscas** avançadas

### 🎫 Sistema de Chamados
- **Abertura de chamados** técnicos e administrativos
- **Atribuição de prioridades** (Urgente, Alta, Média, Baixa)
- **Controle de status** (Aberto, Em Andamento, Resolvido, Fechado)
- **Sistema de categorias** para organização
- **Alertas de vencimento** e acompanhamento de prazos

### 📊 Dashboard e Relatórios
- **Visão geral** em tempo real
- **Métricas e KPIs** importantes
- **Estatísticas** de produtividade
- **Relatórios** personalizáveis

## 🛠️ Tecnologias Utilizadas

- **Backend:** Ruby on Rails 7+
- **Database:** PostgreSQL
- **Frontend:** HTML, CSS, JavaScript
- **Estilo:** CSS customizado com design moderno
- **Autenticação:** Devise (se implementado)

## 📋 Pré-requisitos

- Ruby 3.0+
- Rails 7.0+
- PostgreSQL 12+
- Node.js
- Yarn

## 🚀 Instalação

1. **Clone o repositório**
   
git clone https://github.com/heytavares/pointer.git
cd pointer

2. **Instale as dependências**

bundle install
yarn install

3. **Configure o banco de dados**

rails db:create
rails db:migrate

4. **Execute a aplicação**

rails server
Acesse: http://localhost:3000
