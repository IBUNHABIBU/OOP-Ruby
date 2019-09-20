require_relative '../lib/board.rb'
RSpec.describe Board do
  let(:board){Board.new}
  describe '#display' do
      it 'it displays the board' do
        expect(board.display).to eq(1..9)
      end
  end

  describe '#position_taken?' do 
    it 'checks if there is space on the board' do
      expect(board.position_taken?(1)).to eql(false)
    end 
  end
    
  describe '#win?' do
    it 'checks for no win on board' do
      expect(board.win?).to be false
    end
    
    it 'checks for win situation' do
      board.replace_var(0,"x")
      board.replace_var(1,"x")
      board.replace_var(2,"x")
      expect(board.win?).to eql(true)
    end
  end

  describe '#full?' do
    it 'checks if board is not full' do
      expect(board.full?).to eql(false)
    end 
  end 

  describe "#winner" do
    it 'declares the winner' do
      winner =[board.replace_var(0,"x"),board.replace_var(1,"x"),board.replace_var(2,"x")]
      board.win?
      expect(board.winner).to eql(winner[0])
    end 
  
    it 'declares if there is no winner ' do 
        winner =[board.replace_var(0,"x"),board.replace_var(1,"o"),board.replace_var(2,"x")]
        board.win?
        expect(board.winner).to be nil
      end
    end

    describe '#rem_nums' do 
      it 'removes the choosen number from the array' do
         board.replace_var(1,"x")
         expect( board.rem_nums).to eql([1, 3, 4, 5, 6, 7, 8, 9])
      end
    end 
end

