// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)


// Burger menus
document.addEventListener('DOMContentLoaded', function() {
    const burger = document.querySelector('#mobile-menu-button');
    const menu = document.querySelector('#mobile-menu');
    if (burger && menu) {
        burger.addEventListener('click', function () {
            menu.classList.toggle('hidden');
        });
    }
});
