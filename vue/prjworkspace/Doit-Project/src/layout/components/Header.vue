<template>
    <header>
        <div class="topmenu">
            <div class="contentbox">
                <div class="logo">
                    <button @click="goToPage('/main')">
                        <img src="/images/logo.png" alt="로고"/>
                    </button>
                </div>
                <div class="system">
                    <button class="login" v-b-modal.login>로그인</button>
                    <button class="member" v-b-modal.member>회원가입</button>
                </div>
            </div>
        </div>
        <nav>
            <div class="contentbox"></div>
                <ul>
                    <li v-for="(item, index) in menulists" :key="index" 
                    @click="goToPage(item.link)">
                        <button v-html="item.menutext"></button>
                    </li>
                    <!-- <li><button>메뉴 1</button></li>
                    <li><button>메뉴 2</button></li>
                    <li><button>메뉴 3</button></li>
                    <li><button>메뉴 4</button></li>
                    <li><button>메뉴 5</button></li> -->
                </ul>
        </nav>
        <b-modal id="login" title="modal" hide-footer>
            <template #modal-title>
                <div class="layertit"><i class="bi bi-clipboard-check"/>로그인</div>
            </template>
            <!-- <div>로그인 내용</div> -->
            <div class="modalcontainer">
                <div class="loginform">
                    <label for="id"><i class="bi bi-file-person"/>아이디</label>
                    <b-form-input id="id" placeholder="아이디를 입력하세요."/>
                    <label for="pass"><i class="bi bi-lock"/>비밀번호</label>
                    <b-form-input id="pass" placeholder="비밀번호를 입력하세요."/>
                </div>
                <div class="btnwrap">
                    <b-button variant="login">로그인</b-button>
                </div>
            </div>
        </b-modal>
        <b-modal id="member" title="modal" hide-footer>
            <template #modal-title>
                <div class="layertit">
                    <i class="bi bi-clipboard-check"/> 회원가입
                </div>
            </template>
            <div class="modalcontainer">
                <b-form @submit="Joinmember">
                    <b-form-group id="formid1" label="아이디" label-for="id" description="4~15자리 이내의 영문과 숫자">
                        <b-form-input id="id" v-model="form.id" type="text" placeholder="아이디를 입력하세요."></b-form-input>
                    </b-form-group>

                    <b-form-group id="formid2" label="비밀번호" label-for="pass" description="8자리 이상의 영문과 숫자">
                        <b-form-input id="pass" v-model="form.pass" type="password" placeholder="비밀번호를 입력하세요."></b-form-input>
                    </b-form-group>

                    <b-form-group id="formid3" label="이메일 수신" label-for="mailing" description="이메일 수신 설정">
                        <b-form-radio v-model="form.mail" value="Y">예</b-form-radio>
                        <b-form-radio v-model="form.mail" value="N">아니오</b-form-radio>
                        선택 여부: {{ form.mail }}
                    </b-form-group>

                    <b-form-group id="formid4" label="관심분야 선택" label-for="checkedtype" description="관심 분야 선택">
                        <b-form-checkbox v-model="form.checkedtype" value="html">html</b-form-checkbox>
                        <b-form-checkbox v-model="form.checkedtype" value="javascript">javascipt</b-form-checkbox>
                        <b-form-checkbox v-model="form.checkedtype" value="python">파이썬</b-form-checkbox>
                        관심분야 : {{ form.checkedtype }}
                    </b-form-group>
                    <div class="btnwrap">
                        <b-button type="submit" variant="login">확인</b-button>
                        <b-button type="submit" variant="cancel">취소</b-button>
                    </div>
                </b-form>
            </div>
        </b-modal>
    </header>
</template>

<script>
export default {
    data() {
        return {
            menulists: [
                {menutext: "도서 소개", link: "/book"},
                {menutext: "자료실", link: "/reference"},
                {menutext: "동영상 강의", link: "/movieclass"},
                {menutext: "교재 샘플", link: "/classsample"},
                {menutext: "회사 소개", link: "/company"},
            ],
            form : {
                id:"",
                pass:"",
                mail:"",
                checkedtype:[],
            },
        };
    },
    methods: {
        goToPage(target) {
            if(this.$router.currentRoute.path !== target) {
                this.$router.push(target);
            }
        },
        Joinmember(event){
            event.prventDefault();
            alert(JSON.stringify(this.form))
        }
    }
};
</script>