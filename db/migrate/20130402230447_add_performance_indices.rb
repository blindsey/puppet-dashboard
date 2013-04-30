class AddPerformanceIndices < ActiveRecord::Migration
  def self.up
    add_index :timeline_events, [:subject_id, :subject_type], :name => 'index_timeline_events_primary'
    add_index :timeline_events, [:secondary_subject_id, :secondary_subject_type], :name => 'index_timeline_events_secondary'
    add_index :metrics, [:report_id, :category, :name], :name => 'index_metrics_multi'
    add_index :nodes, :last_apply_report_id
    add_index :node_group_memberships, :node_id
    add_index :node_group_memberships, :node_group_id
  end

  def self.down
    remove_index :node_group_memberships, :node_group_id
    remove_index :node_group_memberships, :node_id
    remove_index :nodes, :last_apply_report_id
    remove_index :metrics, :name => 'index_metrics_multi'
    remove_index :timeline_events, :name => 'index_timeline_events_secondary'
    remove_index :timeline_events, :name => 'index_timeline_events_primary'
  end
end
