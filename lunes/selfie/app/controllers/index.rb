get '/' do
  @photos = Photo.all
  # @first_photo = Photo.find(1)
  # @photo = MiniMagick::Image.open('tigre.jpg')
  # p @first_photo.path
  erb :index
end

post '/upload' do
  p params
  @photo = Photo.new(image: params[:photo][:photo])
  # @photo.file = params[:photo]
  # p params[:photo][:photo][:tempfile].methods
  # @photo = MiniMagick::Image.open('/var/folders/61/_fmfx5rj30sdnztrkjkj_7vc0000gq/T/RackMultipart20170228-8432-6l8x2i.png')
  # p image
  # image.resize "100x100"
  # image.format "png"
  # image.write "output.png"
  @photo.save!

  redirect '/'
end