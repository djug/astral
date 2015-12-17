<dashboard-sidebar>
  <div class="dashboard-sidebar">
    <div class="dashboard-sidebar-header">
      <h3>Astral</h3>
    </div>
    <div class="sidebar-header">
      <h3 class="sidebar-header-text">Stars</h3>
    </div>
    <ul class="dashboard-list sidebar-stars">
      <li class="all-stars dashboard-list-item"><i class="fa fa-inbox"></i> All Stars</li>
      <li class="untagged-stars dashboard-list-item"><i class="fa fa-star-o"></i> Untagged Stars</li>
    </ul>
    <div class="sidebar-header tags-header">
      <h3 class="sidebar-header-text">Tags</h3>
      <div class="tag-button-group">
        <button class="tag-button-group-item" onclick={doSomething}>Add</button>
        <button class="tag-button-group-item">Edit</button>
        <button class="tag-button-group-item">Sort</button>
      </div>
    </div>
    <form class="tag-form" show={addingTag}>
      <input type="text" name="name" placeholder="Tag name">
      <button type="submit">Save</button>
    </form>
    <ul class="dashboard-list sidebar-tags">
      <li class="dashboard-list-item tag droppable">JavaScript</li>
    </ul>
  </div>

  this.addingTag = false
  this.editingTags = false
  this.sortingTags = false

  this.setAddingTagState = (state) => {
    this.addingTag = state
  }
  this.setEditingTagsState = (state) => {
    this.editingTags = state
  }
  this.setSortingTagsState = (state) => {
    this.sortingtags = state
  }
</dashboard-sidebar>
