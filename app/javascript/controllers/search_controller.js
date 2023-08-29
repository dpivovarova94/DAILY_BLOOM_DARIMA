import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    console.log("Connected to search controller");
  }

  search() {
    // event.preventDefault();
    const query = this.inputTarget.value;
    fetch(`/friendships/search?search_query=${encodeURIComponent(query)}`)
      .then(response => response.text())
      
      // .then(data => {
      //   console.log(data)
      //   // Clear previous results
      //   this.resultsTarget.innerHTML = "";
      //   // this.resultsTarget.innerHTML = data[0].username;
      //   // Render matching users from JSON response
      //   if (data.length > 0) {
      //     data.forEach(user => {
      //     this.resultsTarget.innerHTML += `
      //       <div class="friend">
      //         <p> ${user.username}</p>
      //       </div>
      //     `;
      //   });
      //   } else {
      //     this.resultsTarget.innerHTML = "<p>No results found.</p>";
      //   }
      // })

      .then(data => {
        this.resultsTarget.innerHTML = data;
      })
      .catch(error => {
        console.error("Error fetching search results:", error);
      });
  }
}
