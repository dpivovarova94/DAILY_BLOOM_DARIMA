document.addEventListener('DOMContentLoaded', function() {
  const songUrlInput = document.getElementById('post_song');
  const coverPreview = document.getElementById('cover_preview');

  songUrlInput.addEventListener('input', function() {
    const url = songUrlInput.value.trim();

    if (url.includes('open.spotify.com')) {
      const trackId = url.split('/').pop().split('?')[0];
      const embedCode = `<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/${trackId}" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>`;
      coverPreview.innerHTML = embedCode;
    } else if (url.includes('youtube.com') || url.includes('youtu.be')) {
      const videoId = url.includes('youtube.com') ? url.split('v=')[1].split('&')[0] : url.split('/').pop();
      const embedCode = `<iframe style="border-radius:12px" src="https://www.youtube.com/embed/${videoId}" width="100%" height="352" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
      coverPreview.innerHTML = embedCode;
    } else {
      coverPreview.innerHTML = '';
    }
  });
});
