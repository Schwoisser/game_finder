require "test_helper"

class TorunamentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in User.first
    get tournaments_path
    assert_response :success
  end

  test "should get new" do
    sign_in User.first
    get new_tournament_path
    assert_response :success
  end

  test "should get show" do
    sign_in User.first
    get tournament_path(1)
    assert_response :success
  end

  test "should pair if organizer" do
    sign_in User.first
    tournament = Tournament.first
    assert tournament.matches.length == 0
    post tournaments_pair_path, params:{tournament:{tournament_id: tournament.id}}
    # reload Tournament
    assert Tournament.first.matches.length > 0
  end

  test "should pair if odd user-number" do
    sign_in User.first
    tournament = Tournament.first
    tournament.users.delete User.first
    tournament.save
    puts tournament.users.count
    assert tournament.matches.length == 0
    post tournaments_pair_path, params:{tournament:{tournament_id: tournament.id}}
    # reload Tournament
    assert Tournament.first.matches.length > 0
  end

  test "should start new round until tournament ends" do
    sign_in User.first
    tournament = Tournament.first
    round = 1
    tournament.max_number_of_rounds.times do
      post tournaments_pair_path, params:{tournament:{tournament_id: tournament.id}}
      post tournaments_start_round_path, params:{tournament:{tournament_id: tournament.id}}
      tournament = Tournament.first
      assert_equal tournament.current_round, round
      round += 1
    end
    post tournaments_pair_path, params:{tournament:{tournament_id: tournament.id}}
    post tournaments_start_round_path, params:{tournament:{tournament_id: tournament.id}}
    tournament = Tournament.first
    assert_equal tournament.current_round, tournament.max_number_of_rounds

  end

end
