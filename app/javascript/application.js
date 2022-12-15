// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery
import "jstree"

import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/collapse'
import "@nathanvda/cocoon"

import './xclasses/xclass'

Rails.start()
Turbolinks.start()
ActiveStorage.start()