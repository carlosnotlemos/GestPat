# Gestpat - Setup Rápido

## 1️⃣ Criar projeto Rails

```bash
rails _7.1.5.2_ new gestpat -j esbuild --css bootstrap --database=postgresql
```

## 2️⃣ Instalar dependências JS

```bash
yarn add jquery
```

## 3️⃣ jQuery global

Crie `app/javascript/add_jquery.js`:

```js
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
```

## 4️⃣ `application.js`

```js
import "@hotwired/turbo-rails"
import "./controllers"
import './add_jquery'
import * as bootstrap from "bootstrap"
import './sb_admin/jquery.easing.min'
import './sb_admin/sb-admin-2.min'
```

## 5️⃣ CSS / SCSS

`app/assets/stylesheets/application.bootstrap.scss`:

```scss
@import 'bootstrap/scss/bootstrap';
@import 'bootstrap-icons/font/bootstrap-icons';
@import 'sb_admin/sb-admin-2';
```

## 6️⃣ Rodar servidor

```bash
bin/dev
```

✅ Com isso, Rails 7 + ESBuild + Bootstrap + jQuery + SB Admin 2 já está pronto para desenvolver.
