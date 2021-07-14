import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
import "@fortawesome/fontawesome-free/js/all";
import "@fortawesome/fontawesome-free/css/all.css";
import "../stylesheets/account/admin";
import "controllers";
import toastr from './toastr_settings';
import "chartkick/chart.js";
import './notifications/infinite_scroll';
import './dima-search-bundle';

window.bootstrap = require("bootstrap");

Rails.start()
Turbolinks.start()
