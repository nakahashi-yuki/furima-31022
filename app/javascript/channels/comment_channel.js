import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
   const date = new Date(data.content.created_at);
   const year = date.getFullYear();
   const month = date.getMonth();
   const day = date.getDay();
   const hh = date.getHours();
   const mm = date.getMinutes();
   const ss = date.getSeconds();
   const time =( year +"-"+ month +"-"+ day+"" + hh + ":"+ ss + ":" + mm + " +0900" );

    const html = `
    <div class="comment-view" >
      <div class="comment id="comments_text" >
        ${data.content.comment}
      </div>
      <div class="comment-user">
        ${data.user.nickname}      投稿日時： ${time}
      </div>
    </div>
    `;
    const comments = document.getElementsByClassName('comment-box');
    const newComment = document.getElementById('comment_comment');
    comments[0].insertAdjacentHTML('beforeend', html);
    newComment.value='';  }
});       




