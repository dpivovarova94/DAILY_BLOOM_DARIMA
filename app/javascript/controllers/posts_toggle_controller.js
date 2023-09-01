import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["friendsPosts", "myPosts", "myButton", "friendsButton"]

  connect() {
    console.log("Connected to search controller");
  }

  toggler() {

  }
  selectMyPosts() {
    this.myPostsTarget.classList.remove("d-none");
    this.friendsPostsTarget.classList.add("d-none");

    this.myButtonTarget.classList.add("selected")
    this.friendsButtonTarget.classList.remove("selected")

  }
  selectFriendsPosts() {
    this.myPostsTarget.classList.add("d-none");
    this.friendsPostsTarget.classList.remove("d-none");

    this.myButtonTarget.classList.remove("selected")
    this.friendsButtonTarget.classList.add("selected")
  }

}
