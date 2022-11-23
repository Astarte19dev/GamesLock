import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

<div data-controller="refresh-list">
  <%= form_with url: movies_path, method: :get, html: { class: 'mb-5', data: { refresh_list_target: 'form' } } do |f| %>
    <%= f.text_field :query,
                     class: "form-control",
                     placeholder: 'Type a movie title',
                     value: params[:query],
                     data: {
                      refresh_list_target: 'searchInput',
                    } %>
  <% end %>
  <div data-refresh-list-target="list">
  </div>
</div>
