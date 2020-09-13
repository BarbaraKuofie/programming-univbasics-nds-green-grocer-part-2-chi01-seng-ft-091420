require_relative './part_1_solution.rb'
require 'pry' 
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  counter = 0 
  while counter < coupons.length do 
   
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    item_with_coupon = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(item_with_coupon,item)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon 
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else 
        cart_item_with_coupon = {
          :item => item_with_coupon,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :count => coupons[counter][:num]
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end 
    end 
    counter += 1 
  end 
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
