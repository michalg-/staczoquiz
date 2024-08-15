import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {}

    activate(event) {
        event.currentTarget.classList.add("top-1", "mt-1", "border-b-2", "shadow-sm")
        event.currentTarget.classList.remove("border-b-8")
    }
}
