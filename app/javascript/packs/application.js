// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("css/application.scss")
require("jquery")

// import 'leaflet/dist/leaflet.css';
// import 'leaflet-defaulticon-compatibility/dist/leaflet-defaulticon-compatibility.webpack.css';

// import L from 'leaflet';
// import 'leaflet-defaulticon-compatibility';

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import "@hotwired/turbo"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

import "controllers"

require("trix")
require("@rails/actiontext")