# bst_spec.rb
require_relative '../lib/bst'
require "byebug"

RSpec.describe BST do
    let(:bst) { BST.new }
    let(:bst_with_block) {BST.new { |a, b| a.length <=> b.length}}

    context 'when the tree is empty' do
        it 'is empty' do
            expect(bst.empty?).to be true
        end
        
        it 'has size 0' do
            expect(bst.size).to eq(0)
        end
        
        it 'does not include an item' do
            expect(bst.include?(10)).to be false
        end
        
        it 'creates an empty array in-order' do
            expect(bst.to_a).to eq([])
        end
    end
    
    context 'when items are added to the tree' do
        before do
            bst.add(5)
            bst.add(3)
            bst.add(7)
            bst.add(2)
            bst.add(4)

            bst_with_block.add("orange")
            bst_with_block.add("apple")
            bst_with_block.add("peach")
            bst_with_block.add("strawberry")
            bst_with_block.add("banana")
        end
        
        it 'is not empty' do
            expect(bst.empty?).to be false
        end
        
        it 'has the correct size' do
            expect(bst.size).to eq(5)
        end
        
        it 'includes added items' do
            expect(bst.include?(3)).to be true
            expect(bst.include?(6)).to be false
        end
        
        it 'creates a sorted array in-order' do
            expect(bst.to_a).to eq([2, 3, 4, 5, 7])
            expect(bst_with_block.to_a).to eq(["apple", "peach", "orange", "banana", "strawberry"])
        end
    end
    
    context 'when creating a duplicate tree' do
        let(:duplicate_tree) { bst.dup }

        # lazy let, the dup is done on first duplicate_tree call
        it 'has the same size as the original' do
            bst.add(8)
            expect(duplicate_tree.size).to eq(bst.size)
        end
        
        # lazy let, the dup is done on first duplicate_tree call
        it 'contains the same items as the original' do
            bst.add(8)
            expect(duplicate_tree.to_a).to eq(bst.to_a)
        end
        
        it 'does not modify the original tree when adding to the duplicate' do
            duplicate_tree.add(10)
            expect(bst.include?(10)).to be false
        end
    end
end