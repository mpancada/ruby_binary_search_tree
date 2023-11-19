class BST
    attr_reader :root, :compare_method, :size
    
    def initialize(&compare_block)
        @size = 0
        @root = nil
        @compare_method = compare_block || proc { |a, b| a <=> b }
    end
    
    def add(item)
        @root = add_recursive(@root, item)
        @size += 1
    end
    
    def add_recursive(node, item)
        return Node.new(item) if node.nil?
        
        comparison = @compare_method.call(item, node.value)
        
        if comparison < 0
            node.set_left(add_recursive(node.left, item))
        elsif comparison >= 0
            node.set_right(add_recursive(node.right, item))
        end
        
        node
    end
    
    def empty?
        @root.nil?
    end
    
    def include?(item)
        search_recursive(@root, item)
    end
    
    def search_recursive(node, item)
        return false if node.nil?
        
        comparison = @compare_method.call(item, node.value)
        
        if comparison == 0
            true
        elsif comparison < 0
            search_recursive(node.left, item)
        else
            search_recursive(node.right, item)
        end
    end
    
    def each_inorder(&block)
        inorder_traversal(@root, &block)
    end
    
    def collect_inorder(&block)
        result_tree = BST.new(&@compare_method)
        inorder_traversal(@root) { |item| result_tree.add(block.call(item)) }
        result_tree
    end
    
    def to_a
        array = []
        inorder_traversal(@root) { |item| array << item }
        array
    end
    
    def dup
        duplicated_tree = BST.new(&@compare_method)
        duplicate_recursive(@root, duplicated_tree)
        duplicated_tree
    end
    
    private     
    
    def duplicate_recursive(node, duplicated_tree)
        return if node.nil?
        
        duplicated_tree.add(node.value)
        duplicate_recursive(node.left, duplicated_tree)
        duplicate_recursive(node.right, duplicated_tree)
    end
    
    def inorder_traversal(node, &block)
        return if node.nil?
        
        inorder_traversal(node.left, &block)
        block.call(node.value)
        inorder_traversal(node.right, &block)
    end
    
    class Node
        attr_reader :value, :left, :right
        
        def initialize(value)
            @value = value
            @left = nil
            @right = nil
        end

        def set_left node
            @left = node
        end

        def set_right node
            @right = node
        end
    end
end