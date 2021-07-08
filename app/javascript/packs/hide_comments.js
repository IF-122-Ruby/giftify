function hideComments(elementID) { 
  let hidden_comments = document.getElementById(elementID);
  if (hidden_comments.style.display === 'none') {
      hidden_comments.style.display = 'block';
  } else {
    hidden_comments.style.display = 'none';
  }
 }

 window.hideComments = hideComments;
