require_relative './part_1_solution.rb'
def apply_coupons(cart, coupons)
  counter = 0 
  while counter < coupons.length do
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    item_with_coupon = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(item_with_coupon,cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon 
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else 
        cart_item_with_coupon = {
          :item => item_with_coupon,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :count => coupons[counter][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end 
    end 
    counter += 1 
  end 
  cart 
end


def apply_clearance(cart)
 counter = 0 
 while counter < cart.length do 
   if cart[counter][:clearance] == true 
    cart[counter][:price] = (cart[counter][:price]-(cart[counter][:price]*0.20)).round(2)
 end 
   counter += 1 
 end 
 cart 
end


def checkout(cart, coupons)
consolidated_cart = consolidate_cart(cart)
applied_coupons = applied_coupons(consolidate_cart)
 clearance_cart = apply_clearance(applied_coupons)
 total = 0 
 counter = 0 
 while counter < clearance_cart.length do 
   total = total += clearance_cart[counter][:price] * clearance_cart_cart[counter][:count]
   counter += 1 
 end 
end
