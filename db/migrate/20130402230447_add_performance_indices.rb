class AddPerformanceIndices < ActiveRecord::Migration
  def self.up
    add_index :timeline_events, [:subject_id, :subject_type]
    add_index :timeline_events, [:secondary_subject_id, :secondary_subject_type]
    add_index :metrics, [:report_id,:category, :name]
    add_index :nodes, :last_apply_report_id
    add_index :node_group_memberships, :node_id
    add_index :node_group_memberships, :node_group_id
  end

  def self.down
    remove_index :node_group_memberships, :node_group_id
    remove_index :node_group_memberships, :node_id
    remove_index :nodes, :last_apply_report_id
    remove_index :metrics, [:report_id,:category, :name]
    remove_index :timeline_events, [:secondary_subject_id, :secondary_subject_type]
    remove_index :timeline_events, [:subject_id, :subject_type]
  end
end
