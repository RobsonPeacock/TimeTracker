require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';
import '../stylesheets/application'
import "@fortawesome/fontawesome-free/js/all";
import iziToast from 'izitoast/dist/js/iziToast';

window.iziToast = iziToast;

iziToast.settings({
  position: 'topRight'
});
