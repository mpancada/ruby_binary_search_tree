# ruby_binary_search_tree

Binary Search Tree ruby class with the follwoing methods:
- BST.new{compare_method} – return a new, empty BST. If a block of code is
provided, this code is used to compare two objects in the tree during insertion, search, etc.
This block should accept two parameters and return 1, -1, or 0, like Ruby’s <=> operator. If
no block is provided, the <=> operator is used for comparison.
- add(item) – add a new item to the binary tree. Add must maintain a valid binary
search tree structure as new data is added to the tree. Duplicate items should be stored in
the right subtree.
- empty? – returns true if the tree is empty. Otherwise returns false.
- include?(item) – returns true if the item is found in the tree, otherwise returns
false. When the tree is balanced, search should take no more than O(log2 n) time.
- size – returns the number of items in the tree.
- each_inorder{block} – performs an in-order traversal of the tree, passing each
item found to block.
Writing Iterators in Ruby
- collect_inorder{block} – performs an in-order traversal of the tree, passing each
item found to block. The values returned by block are collected into a new BST, which is
returned by collect_inorder.
- to_a – returns a sorted array of all the elements in the BST.
- dup – returns a new binary search tree with the same contents as the original tree.
This operation should perform a deep copy of the original tree.
