
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["header"];

  connect() {
    this.lastScrollTop = 0;
    window.addEventListener("scroll", this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this));
  }

  handleScroll() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const direction = scrollTop > this.lastScrollTop ? "down" : "up";

    if (direction === "down") {
      this.headerTarget.classList.add("hide");
    } else {
      this.headerTarget.classList.remove("hide");
    }

    this.lastScrollTop = scrollTop;
  }
}
