import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["items", "form", "dropdownProduct", "dropdownQuantity"];

  // connect() {
  //   console.log(this.element);
  //   console.log(this.itemsTarget);
  //   console.log(this.formTarget);
  //   console.log(this.dropdownProductTarget)
  // }

  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        }
        this.formTarget.outerHTML = data.form;
      });
  }

  update_select_options(event) {

    while (this.dropdownQuantityTarget.length > 0) {
      this.dropdownQuantityTarget.remove(0);
    }

    fetch(`/products/${this.dropdownProductTarget.value}`, { method: 'GET', headers: { 'Accept': "application/json" }})
      .then(response => response.json())
      .then(data => {
        // console.log(data.product_stock)
        for (let number = 1; number <= data.product_stock; number++) {
          let option = document.createElement("option");
          option.textContent = number;
          option.value = number;
          this.dropdownQuantityTarget.add(option);
        }
      });
  }
}
