<!--
 * @Author: wjn
 * @Date: 2020-05-06 16:50:13
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-06 16:50:22
 -->
```
    @Delete({"delete from `view` where id = #{id}"})
    int deleteById(Long id);

    @Select({"select * from `view` where id = #{id}"})
    View getById(Long id);


    @Update({
            "update `view`",
            "set `name` = #{name,jdbcType=VARCHAR},",
            "`description` = #{description,jdbcType=VARCHAR},",
            "`project_id` = #{projectId,jdbcType=BIGINT},",
            "`source_id` = #{sourceId,jdbcType=BIGINT},",
            "`sql` = #{sql,jdbcType=LONGVARCHAR},",
            "`model` = #{model,jdbcType=LONGVARCHAR},",
            "`variable` = #{variable,jdbcType=LONGVARCHAR},",
            "`config` = #{config,jdbcType=LONGVARCHAR},",
            "`update_by` = #{updateBy,jdbcType=BIGINT},",
            "`update_time` = #{updateTime,jdbcType=TIMESTAMP}",
            "where id = #{id,jdbcType=BIGINT}"
    })
    int update(View view);
```