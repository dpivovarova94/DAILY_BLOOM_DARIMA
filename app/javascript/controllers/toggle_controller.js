import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "bubble"]

  connect() {
    // console.log("Hello from toggle_controller.js")
  }

  fire(event) {
    this.togglableElementTargets.forEach((element) => {
      element.classList.add("d-none")
    })

    const formId = event.currentTarget.dataset.formId;

    const targetElement = this.togglableElementTargets.find((element) => {
      return element.id === formId;
    });

    targetElement.classList.remove("d-none");
    this.bubbleTargets.forEach((element) => {
      element.classList.add("d-none")
    })



    // console.log(event.currentTarget.dataset.formId)

    // this.togglableElementTargets.find((element) => {
    //   element.id = event.currentTarget.dataset.formId
    //   element.classList.remove("d-none");
    // })
    // console.log( element.id )



    // if (targetElement) {
    //   if (targetElement.classList.contains("d-none")) {
    //     targetElement.classList.remove("d-none"); // Show the form
    //   } else {
    //     targetElement.classList.add("d-none"); // Hide the form
    //   }
    // }

    // Hide other forms
    // this.togglableElementTargets.forEach((element) => {
    //   if (element !== targetElement) {
    //     element.classList.add("d-none");
    //   }
    // });

  }
}
