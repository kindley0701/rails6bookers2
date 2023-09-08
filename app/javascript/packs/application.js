// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"
import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application"

// raty.jsの導入
import Raty from "./raty.js"

// ratyという関数の導入・宣言
window.raty = function(elem,opt){ //window.で全ページに対して定義
    var raty =  new Raty(elem,opt) //raty.jsからRaty関数の呼び出し．
    raty.init(); //初期化
    return raty; //ratyを返す．
}

Rails.start()
Turbolinks.start()
ActiveStorage.start()
