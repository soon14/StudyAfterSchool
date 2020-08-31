<!--
 * @Author: wjn
 * @Date: 2020-04-26 17:19:07
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-12 17:37:16
 -->


    @TableId(type = IdType.ASSIGN_UUID)
    private String workspaceUserId;
    private String workspaceId;
    private String userId;
    private Integer roleId;

    private String accountName;
    private String nickName;
    private String email;
    private String phone;
    private Boolean admin;
    private Boolean owner;
    private Boolean status;

    @JsonProperty("registerTime")
    private Date gmtCreate;




"workspaceId": "2ad61b39b53b03d13a7161b3e0642585",
"workspaceName":"测试空间",
"workspaceDesc":""
"owner":{
    "userId": "2ad61b39b53b03d13a7161b3e0642585",
    "accountName": "cy",
    "nickName": "cy_admin",
    "email": "123@qq.com",
    "phone": "13391140910",
    "admin": true,
    "owner": false,
},
"allowShare":true,
"allowPublish":true,
"default":true,
"createUser": "2ad61b39b53b03d13a7161b3e0642585",
"updateUser": "2ad61b39b53b03d13a7161b3e0642585",
"gmtCreate": "2020-04-29T09:10:05.000+0000",
"gmtModified": "2020-04-29T09:10:05.000+0000"


"workspaceId": "2ad61b39b53b03d13a7161b3e0642585",
"workspaceName":"测试空间",
"workspaceDesc":""

"userId": "2ad61b39b53b03d13a7161b3e0642585",
"accountName": "cy",
"nickName": "cy_admin",
"email": "123@qq.com",
"phone": "13391140910",
"admin": true,
"owner": false,

"allowShare":true,
"allowPublish":true,
"default":true,
"createUser": "2ad61b39b53b03d13a7161b3e0642585",
"updateUser": "2ad61b39b53b03d13a7161b3e0642585",
"gmtCreate": "2020-04-29T09:10:05.000+0000",
"gmtModified": "2020-04-29T09:10:05.000+0000"
