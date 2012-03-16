require 'metadown'

$posts = Dir["posts/*"].inject({}) do |hsh, file|
  data = Metadown.render(File.read(file))

  hsh[data.metadata["slug"]] = data

  hsh
end

class BlogResource < Webmachine::Resource  
  def resource_exists?
    return true unless request.path_info[:slug] #index

    @post = $posts[request.path_info[:slug]] if request.path_info[:slug]
    !@post.nil?
  end

  def to_html
    return "INDEX" unless @post

    Template.new(:post).render(
      :contents => @post.output,
      :title => @post.metadata["title"],
      :date => @post.metadata["date"]
    )
  end
end