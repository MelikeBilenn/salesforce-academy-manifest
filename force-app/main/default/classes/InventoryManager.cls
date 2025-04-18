public class InventoryManager {
    private class Item {
        String name;
        Integer quantity;
        
        Item(String name, Integer quantity) {
            this.name = name;
            this.quantity = quantity;
        }
    }
    
    private Map<String, Item> inventory = new Map<String, Item>();

    public void addItem(String Name, Integer Quantity) {
        if (Name == null || Quantity == null) {
            return;
        }
        
        if (inventory.containsKey(Name)) {
            Item existingItem = inventory.get(Name);
            existingItem.quantity += Quantity; 
        } else {
        	Item newItem = new Item(Name, Quantity);
        	inventory.put(Name, newItem);
        }

    }
    
    public void removeItem(String Name, Integer Quantity) {
        if (Name == null || Quantity == null) {
            return;
        }
        
        if (inventory.containsKey(Name)) {
            Item existingItem = inventory.get(Name);
            if (existingItem.quantity > Quantity) {
                existingItem.quantity -= Quantity; 
            } else {
                existingItem.quantity = 0;
            }
        }

    }
    
    public Integer getQuantity(String Name, Integer Quantity) {
        if (inventory.containsKey(Name)) {
            Item existingItem = inventory.get(Name);
            return existingItem.quantity;
        } else {
            return 0;
        }
    }
}