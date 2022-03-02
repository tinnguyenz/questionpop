class HomeController < ShopifyApp::AuthenticatedController
  def index


  end

  def modal
  end

  def modal_buttons
  end

  def regular_app_page
  end

  def pagination
    @total_pages = 3
    @page = (params[:page].presence || 1).to_i
    @previous_page = "/pagination?page=#{ @page - 1 }" if @page > 1
    @next_page = "/pagination?page=#{ @page + 1 }" if @page < @total_pages
  end
end
