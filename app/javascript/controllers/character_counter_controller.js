import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["counter"]

  connect() {
    console.log(this.element);
    console.log(this.counterTarget);
  }
}
