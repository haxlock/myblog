<div id="music163player">
  <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=1974391626&auto=1&height=66"></iframe>
</div>

{# recent posts #}
{% if theme.recent_posts %}
  <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.recent_posts_layout  }}">
    <div class="links-of-blogroll-title">
      <!-- modify icon to fire by szw -->
      <i class="fa fa-history fa-{{ theme.recent_posts_icon | lower }}" aria-hidden="true"></i>
      {{ theme.recent_posts_title }}
    </div>
    <ul class="links-of-blogroll-list">
      {% set posts = site.posts.sort('-date') %}
      {% for post in posts.slice('0', '5') %}
        <li class="recent_posts_li">
          <a href="{{ url_for(post.path) }}" title="{{ post.title }}" target="_blank">{{ post.title }}</a>
        </li>
      {% endfor %}
    </ul>
  </div>
{% endif %}
