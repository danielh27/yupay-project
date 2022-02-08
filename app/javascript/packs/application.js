// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "chartkick/chart.js"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
// External imports
import JQuery from 'jquery';
import "controllers"
import "bootstrap";

window.$ = window.JQuery = JQuery;

// Internal imports, e.g:
import { initSweetalert } from '../plugins/init_sweetalert';
import { sidebar_active_link} from '../components/sidebar_active_link';


document.addEventListener('turbolinks:load', () => {
  initSweetalert();
  sidebar_active_link();
});
