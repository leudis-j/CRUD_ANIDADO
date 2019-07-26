class ProductsController < ApplicationController

    def create
        @product = Product.new( product_params ) 
        @product.category = Category.find(params[:category_id])
        @product.save!

        redirect_to @product.category, notice: 'Producto guardado exitosamente'
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        respond_to do |format|
          format.html { redirect_to @product.category, notice: 'Producto eliminado exitosamente' }
          format.json { head :no_content }
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :price)
    end
end
