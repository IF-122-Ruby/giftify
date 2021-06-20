import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
import "bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import "@fortawesome/fontawesome-free/css/all.css";
import "../stylesheets/account/admin";
import "controllers";
import toastr from './toastr_settings';

Rails.start()
Turbolinks.start()
