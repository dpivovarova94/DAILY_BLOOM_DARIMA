import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["friendsPosts", "myPosts"]

  connect() {
    console.log("Connected to search controller");
  }

  toggler() {

  }
  selectMyPosts() {
    this.myPostsTarget.classList.remove("d-none");
    this.friendsPostsTarget.classList.add("d-none");

  }
  selectFriendsPosts() {
    this.myPostsTarget.classList.add("d-none");
    this.friendsPostsTarget.classList.remove("d-none");
  }

}
